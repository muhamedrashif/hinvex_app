import 'package:hinvex_app/features/authentication/data/model/user_details_model.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';

abstract class IShortListFacade {
  FutureResult<void> uploadShortListItem(
      PropertyModel propertyModel, UserModel userModel) {
    throw UnimplementedError('uploadShortListItem() not impl');
  }

  FutureResult<List<PropertyModel>> fetchFavoritePosts(
      List<String> productIds) {
    throw UnimplementedError('fetchFavoritePosts() is not implemented');
  }

  void clearData();
}
