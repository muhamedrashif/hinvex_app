import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';

abstract class ICategoryFacade {
  FutureResult<List<PropertyModel>> fetchFilterPosts({
    required bool? isBuy,
    required int? bedroom,
    required int? category,
    required int? furnishingCount,
    required int? listedByCount,
    required int? statusCount,
    required double? budgetSliderValue,
    required double? sqPriceSliderValue,
  }) {
    throw UnimplementedError('fetchFilterPosts() not impl');
  }

  void clearData() {
    throw UnimplementedError('clearData( not impl)');
  }
}
