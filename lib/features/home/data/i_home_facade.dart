import 'package:dartz/dartz.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';

abstract class IHomeFacade {
  FutureResult<List<PropertyModel>> fetchProduct(PlaceCell placeMark) {
    throw UnimplementedError('fetchProduct is not implemented');
  }

  FutureResult<Unit> fecthUserLocaltion(PlaceCell placeMark) {
    throw UnimplementedError('fecthUserLocaltion is not implemented');
  }

  void clearData() {
    throw UnimplementedError('clearData is not implemented');
  }
}
