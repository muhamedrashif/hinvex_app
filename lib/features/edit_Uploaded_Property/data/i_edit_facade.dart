import 'package:hinvex_app/features/location/data/model/location_model_main.dart/location_model_main.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';

abstract class IEditPropertyFacade {
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

  FutureResult<void> editProperty(PropertyModel propertyModel) {
    throw UnimplementedError('EditProperty() not impl');
  }
}
