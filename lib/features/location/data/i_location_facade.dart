import 'package:dartz/dartz.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';

import 'model/location_model_main.dart/location_model_main.dart';
import 'model/search_location_model/search_location_model.dart';

abstract class ILocationFacade {
  Stream<Either<MainFailure, PlaceCell>> getUserCurrentPosition() {
    throw UnimplementedError(
      'getUserCurrentPosition() is not implemented, '
      'implement the method before calling it',
    );
  }

  FutureResult<Unit> saveUserLocation(String data) {
    throw UnimplementedError(
      'saveUserLocation() is not implemented, '
      'implement the method before calling it',
    );
  }

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

  FutureResult<bool> openSettings() {
    throw UnimplementedError(
      'openSettings() is not implemented, '
      'implement the method before calling it',
    );
  }
}
