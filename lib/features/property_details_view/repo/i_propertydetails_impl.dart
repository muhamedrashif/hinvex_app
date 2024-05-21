import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hinvex_app/features/property_details_view/data/i_propertydetails_facade.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPropertyDetailsFacade)
class IPropertyDetailsImpl implements IPropertyDetailsFacade {
  IPropertyDetailsImpl(
    this._firestore,
  );
  final FirebaseFirestore _firestore;
  @override
  Future<QuerySnapshot<Map<String, dynamic>>> fetchUser(String userId) {
    try {
      final reuslt = _firestore
          .collection('users')
          .where('userId', isEqualTo: userId)
          .get();
      return reuslt;
    } catch (e) {
      print(e.toString());
      return Future.error(e);
    }
  }
}
