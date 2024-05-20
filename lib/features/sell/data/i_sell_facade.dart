import 'package:dartz/dartz.dart';
import 'package:hinvex_app/features/location/data/model/location_model_main.dart/location_model_main.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';

abstract class ISellFacade {
  Stream<Either<MainFailure, PlaceCell>> getUserCurrentPosition() {
    throw UnimplementedError(
      'getUserCurrentPosition() is not implemented, '
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

  FutureResult<PropertyModel> uploadPropertyToFireStore({
    required PropertyModel propertyModel,
    // required List<String> imageByte,
  }) {
    throw UnimplementedError('uploadPropertyToFireStore() not impl');
  }

  FutureResult<void> updateUploadedPosts(PropertyModel propertyModel) {
    throw UnimplementedError('updateUploadedPosts() not impl');
  }
}
