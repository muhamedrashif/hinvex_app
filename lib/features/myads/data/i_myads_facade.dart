import 'package:dartz/dartz.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';

abstract class IMyAdsFacade {
  FutureResult<List<PropertyModel>> fetchProduct() {
    throw UnimplementedError('fetchProduct is not implemented');
  }

  FutureResult<Unit> deleteUploadedPosts(String id) {
    throw UnimplementedError('deleteUploadedPosts() not impl');
  }

  void clearData();
}
