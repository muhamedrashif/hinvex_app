import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hinvex_app/features/banner/data/i_banner_facade.dart';
import 'package:hinvex_app/features/banner/data/model/banner_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IBannerFacade)
class IBannerImpl implements IBannerFacade {
  IBannerImpl(this._firestore);
  final FirebaseFirestore _firestore;

  // FETCH MOBILE BANNERS
  @override
  Stream<QuerySnapshot<BannerModel>> fetchMobileBanners() {
    final result = _firestore
        .collection('banners')
        .orderBy('timestamp', descending: true)
        .where('status', isEqualTo: '1')
        .withConverter(
          fromFirestore: (snapshot, options) => BannerModel.fromSnap(snapshot),
          toFirestore: (value, options) => value.toJson(),
        )
        .snapshots();
    return result;
  }
}
