import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/edit_Uploaded_Property/data/i_edit_facade.dart';
import 'package:hinvex_app/features/location/data/model/location_model_main.dart/location_model_main.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';
import 'package:hinvex_app/features/location/repo/i_location_impl.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/failures/exeception/execeptions.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/services/upload_location_services.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IEditPropertyFacade)
class IEditPropertyImpl implements IEditPropertyFacade {
  IEditPropertyImpl(
    this._firestore,
    this.uploadPlaceService,
    this.getCurrentPosition,
  );
  final FirebaseFirestore _firestore;
  final UploadPlaceService uploadPlaceService;
  final GetCurrentPosition getCurrentPosition;

  @override
  FutureResult<PlaceCell> serchLocationByAddres({
    required String latitude,
    required String longitude,
  }) async {
    final result = await LocationService.getLocation(
      latitude: latitude,
      longitude: longitude,
    );

    return result.fold(
      left,
      (r) async {
        final placeCell = getCurrentPosition.convertToPlaceCell(
          locationModel: r,
          latitude: double.parse(latitude),
          longitude: double.parse(longitude),
        );
        final result = await uploadPlaceService.uploadPlace(placeCell);

        return result.fold(
          left,
          (r) => right(placeCell),
        );
      },
    );
  }

  @override
  FutureResult<List<PlaceResult>> pickLocationFromSearch(
    String searchText,
  ) async {
    try {
      final res = await LocationService.searchPlaces(searchText);
      if (res != null) {
        return right(res);
      } else {
        return left(
          const MainFailure.noDataFountFailure(errorMsg: 'No result found'),
        );
      }
    } catch (e) {
      return left(MainFailure.serverFailure(errorMsg: e.toString()));
    }
  }

  @override
  FutureResult<void> editProperty(PropertyModel propertyModel) async {
    try {
      debugPrint("Updating post in Firestore with ID: ${propertyModel.id}");
      await _firestore
          .collection('posts')
          .doc(propertyModel.id)
          .update(propertyModel.toJson());
      return right(null);
    } on CustomExeception catch (e) {
      return left(MainFailure.serverFailure(errorMsg: e.errorMsg));
    }
  }
}
