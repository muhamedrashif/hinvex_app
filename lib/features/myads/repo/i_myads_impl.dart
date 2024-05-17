import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:hinvex_app/features/myads/data/i_myads_facade.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IMyAdsFacade)
class IMyAdsImpl implements IMyAdsFacade {
  IMyAdsImpl(this._firestore);
  final FirebaseFirestore _firestore;

  QueryDocumentSnapshot<Map<String, dynamic>>? lastDoc;
  bool noMoreData = false;
  @override
  FutureResult<List<PropertyModel>> fetchProduct() async {
    if (noMoreData == true) return right([]); //THERE IS NOMORE DATA
    try {
      final result = lastDoc == null
          ? await _firestore
              .collection('posts')
              .orderBy('createDate', descending: true)
              .where('userId', isEqualTo: "owner")
              .limit(5)
              .get()
          : await _firestore
              .collection('posts')
              .orderBy('createDate', descending: true)
              .where('userId', isEqualTo: "owner")
              .startAfterDocument(lastDoc!)
              .limit(5)
              .get();
      log("result  ${result.docs.length}");

      if (result.docs.length < 5 || result.docs.isEmpty) {
        noMoreData = true;
      } else {
        lastDoc = result.docs.last;
      }

      final propertyList =
          result.docs.map((e) => PropertyModel.fromSnap(e)).toList();

      return right(propertyList);
    } catch (e) {
      print(e.toString());
      return left(MainFailure.noDataFountFailure(errorMsg: e.toString()));
    }
  }

  @override
  void clearData() {
    lastDoc = null;
    noMoreData = false;
  }
}
