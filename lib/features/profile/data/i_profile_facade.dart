import 'dart:io';

import 'package:hinvex_app/features/authentication/data/model/user_details_model.dart';
import 'package:hinvex_app/features/location/data/model/location_model_main.dart/location_model_main.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';

abstract class IProfileFacade {
  // Future<QuerySnapshot<Map<String, dynamic>>> fetchUser() {
  //   throw UnimplementedError('fetchUser() not impl');
  // }

  FutureResult<PlaceCell> serchLocationByAddres({
    required String latitude,
    required String longitude,
  }) {
    throw UnimplementedError(
      'serchLocationByAddres() is not implemented, '
      'implement the method before calling it',
    );
  }

  FutureResult<List<PlaceResult>> pickLocationFromSearch(String searchText) {
    throw UnimplementedError('pickLocationFromMap() is not implemented');
  }

  FutureResult<void> updateUserDetils(UserModel userModel) {
    throw UnimplementedError('updateUserDetils() not impl');
  }

  FutureResult<File> getImage() {
    throw UnimplementedError('getImage() not impl');
  }

  FutureResult saveImage({required File imageFile}) {
    throw UnimplementedError('saveImage() not impl');
  }

  FutureResult deleteImage() {
    throw UnimplementedError();
  }
}
