import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/data/model/user_details_model.dart';
import 'package:hinvex_app/features/location/data/model/location_model_main.dart/location_model_main.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';
import 'package:hinvex_app/features/location/repo/i_location_impl.dart';
import 'package:hinvex_app/features/profile/data/i_profile_facade.dart';
import 'package:hinvex_app/general/failures/exeception/execeptions.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/services/image_pick_service.dart';
import 'package:hinvex_app/general/services/upload_location_services.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IProfileFacade)
class IProfileImpl implements IProfileFacade {
  IProfileImpl(this._firestore, this.uploadPlaceService,
      this.getCurrentPosition, this.imageService);
  final FirebaseFirestore _firestore;
  final UploadPlaceService uploadPlaceService;
  final GetCurrentPosition getCurrentPosition;
  final ImageService imageService;

  // @override
  // Future<QuerySnapshot<Map<String, dynamic>>> fetchUser() async {
  //   try {
  //     String userId = FirebaseAuth.instance.currentUser!.uid;
  //     final result = await _firebaseFirestore
  //         .collection('users')
  //         .where('userId', isEqualTo: userId)
  //         .get();
  //     return result;
  //   } catch (e) {
  //     log("Error fetching user: $e");
  //     return Future.error(e);
  //   }
  // }

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
  FutureResult<void> updateUserDetils(UserModel userModel) async {
    try {
      log("inside for update");
      debugPrint("Updating user in Firestore with ID: ${userModel.id}");
      await _firestore
          .collection('users')
          .doc(userModel.id)
          .update(userModel.toJson());
      return right(null);
    } on CustomExeception catch (e) {
      return left(MainFailure.serverFailure(errorMsg: e.errorMsg));
    }
  }

  @override
  FutureResult<File> getImage() async {
    try {
      return await imageService.getGalleryImage();
    } catch (ex) {
      return left(MainFailure.imagePickFailed(errorMsg: ex.toString()));
    }
  }

  @override
  FutureResult saveImage({required File imageFile}) async {
    try {
      return await imageService.saveImage(imageFile: imageFile);
    } on CustomExeception catch (e) {
      return left(MainFailure.imageUploadFailure(errorMsg: e.errorMsg));
    }
  }

  @override
  FutureResult deleteImage() {
    throw UnimplementedError();
  }
}
