import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hinvex_app/features/banner/data/model/banner_model.dart';

abstract class IBannerFacade {
  Stream<QuerySnapshot<BannerModel>> fetchMobileBanners() {
    throw UnimplementedError('fetchMobileBanners() not impl');
  }
}
