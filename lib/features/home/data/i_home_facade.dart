import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IHomeFacade {
  Future<QuerySnapshot<Map<String, dynamic>>> fetchMobileBanners() {
    throw UnimplementedError('fetchMobileBanners() not impl');
  }
}
