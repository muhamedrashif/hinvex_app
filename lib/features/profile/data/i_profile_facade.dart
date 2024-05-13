import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IProfileFacade {
  Future<QuerySnapshot<Map<String, dynamic>>> fetchUser() {
    throw UnimplementedError('fetchUser() not impl');
  }
}
