import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:hinvex_app/features/location/data/model/location_model_main.dart/location_model_main.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';
import 'package:hinvex_app/features/location/repo/i_location_impl.dart';
import 'package:hinvex_app/features/sell/data/i_sell_facade.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/failures/exeception/execeptions.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/services/key_word_generate.dart';
import 'package:hinvex_app/general/services/upload_location_services.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ISellFacade)
class ISellImpl implements ISellFacade {
  ISellImpl(
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

  // UPLOAD TO FIRESTORE
  @override
  FutureResult<PropertyModel> uploadPropertyToFireStore({
    required PropertyModel propertyModel,
  }) async {
    final builder = AlfabetKeywordsBuilder();
    builder.descriptionToKeywords(
        '${propertyModel.propertyTitle} ${propertyModel.description} ${propertyModel.propertyDetils}');
    final keywords = builder.build();
    try {
      final response = await _firestore
          .collection('posts')
          .add(propertyModel.copyWith(keywords: keywords).toJson());
      return right(propertyModel.copyWith(id: response.id));
    } on CustomExeception catch (e) {
      return left(MainFailure.imageUploadFailure(errorMsg: e.errorMsg));
    }
  }
}
