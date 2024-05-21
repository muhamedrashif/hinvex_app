import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IPropertyDetailsFacade {
  Future<QuerySnapshot<Map<String, dynamic>>> fetchUser(String userId) {
    throw UnimplementedError('fetchUser() not impl');
  }
}
