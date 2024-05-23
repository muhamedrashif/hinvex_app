import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hinvex_app/features/home/data/i_home_facade.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IHomeFacade)
class IHomeImpl implements IHomeFacade {
  IHomeImpl(this._firestore);
  final FirebaseFirestore _firestore;

  // FETCH MOBILE BANNERS
  @override
  Future<QuerySnapshot<Map<String, dynamic>>> fetchMobileBanners() {
    try {
      final result = _firestore
          .collection('banners')
          .orderBy('timestamp', descending: true)
          .where('status', isEqualTo: '1')
          .get();

      return result;
    } catch (e) {
      print(e.toString());
      return Future.error(e);
    }
  }
}
