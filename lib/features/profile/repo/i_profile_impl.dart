import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hinvex_app/features/profile/data/i_profile_facade.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IProfileFacade)
class IProfileImpl implements IProfileFacade {
  IProfileImpl(this._firebaseFirestore);
  final FirebaseFirestore _firebaseFirestore;

  // @override
  // Future<QuerySnapshot<Map<String, dynamic>>> fetchUser() {
  //   String userId = "Xrh4ftQDoHR1VQAuGf3cyNDqRHi1";
  //   final reuslt = _firebaseFirestore
  //       .collection('users')
  //       .where('userId', isEqualTo: userId)
  //       .get();
  //   return reuslt;
  // }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> fetchUser() async {
    try {
      String userId = "Xrh4ftQDoHR1VQAuGf3cyNDqRHi1";
      final result = await _firebaseFirestore
          .collection('users')
          .where('userId', isEqualTo: userId)
          .get();
      return result;
    } catch (e) {
      // Handle any errors here
      print("Error fetching user: $e");
      // You might want to return something appropriate here,
      // for example, an empty QuerySnapshot or re-throw the error.
      return Future.error(e);
    }
  }
}
