import 'package:hinvex_app/features/location/data/model/popular_cities_model/popularcities_model.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';

abstract class ICategoryFacade {
  FutureResult<List<PopularCitiesModel>> fetchPopularCities() {
    throw UnimplementedError('fetchMobileBanners() not impl');
  }
}
