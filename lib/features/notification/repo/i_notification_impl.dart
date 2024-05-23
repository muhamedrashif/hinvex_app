import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:hinvex_app/features/notification/data/i_notification_facade.dart';
import 'package:hinvex_app/features/notification/data/model/notification_model.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: INotificationFacade)
class INotificationImpl implements INotificationFacade {
  INotificationImpl(
    this._firestore,
  );
  final FirebaseFirestore _firestore;
  DocumentSnapshot<Map<String, dynamic>>? lastDoc;
  bool noMoreData = false;

  @override
  FutureResult<List<NotificationModel>> fetchNotifications() async {
    if (noMoreData) return right([]);

    int limit = lastDoc == null ? 10 : 5;
    try {
      Query query = _firestore.collection("notification");
      query = query.orderBy('timestamp', descending: true);

      if (lastDoc != null) {
        log("MORE DATA CALLED");
        query = query.startAfterDocument(lastDoc!);
      }

      final snapshot = await query.limit(limit).get();

      if (snapshot.docs.length < limit || snapshot.docs.isEmpty) {
        noMoreData = true;
      } else {
        lastDoc = snapshot.docs.last as DocumentSnapshot<Map<String, dynamic>>;
      }

      final notificationList = snapshot.docs
          .map(
            (e) => NotificationModel.fromSnap(
                e as QueryDocumentSnapshot<Map<String, dynamic>>),
          )
          .toList();
      return right(notificationList);
    } catch (ex) {
      log("Error:$ex");
      return left(MainFailure.noDataFountFailure(errorMsg: ex.toString()));
    }
  }

  @override
  void clearData() {
    lastDoc = null;
    noMoreData = false;
  }
}
