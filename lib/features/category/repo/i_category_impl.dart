import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';

class CategoryFilterRepository {
  factory CategoryFilterRepository() {
    return CategoryFilterRepository._();
  }
  CategoryFilterRepository._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference get _posts => firebaseFirestore.collection('posts');

  DocumentSnapshot<Map<String, dynamic>>? lastDoc;
  bool noMoreData = false;

  FutureResult<List<PropertyModel>> fetchFilterPosts({
    required bool? isBuy,
    required int? bedroom,
    required int? category,
    required int? furnishingCount,
    required int? listedByCount,
    required int? statusCount,
    required double? budgetSliderValue,
    required double? sqPriceSliderValue,
  }) async {
    if (noMoreData) return right([]);

    int limit = lastDoc == null ? 5 : 4;
    try {
      Query query = _posts;

      //FILTERING

      if (category != null) {
        query = category == 1
            ? query.where('propertyCategory', isEqualTo: "house")
            : category == 2
                ? query.where('propertyCategory', isEqualTo: "apartments")
                : category == 3
                    ? query.where('propertyCategory', isEqualTo: "landsPlots")
                    : category == 4
                        ? query.where('propertyCategory',
                            isEqualTo: "commercial")
                        : category == 5
                            ? query.where('propertyCategory',
                                isEqualTo: "coWorkingSpace")
                            : query.where('propertyCategory',
                                isEqualTo: "pGGuestHouse");
      }

      if (isBuy != null) {
        query = isBuy == true
            ? query.where('propertyType', isEqualTo: "sell")
            : query.where('propertyType', isEqualTo: "rent");
      }

      if (bedroom != null && (category == 1 || category == 2)) {
        query = bedroom == 1
            ? query.where('bedRooms', isEqualTo: 1)
            : bedroom == 2
                ? query.where('bedRooms', isEqualTo: 2)
                : bedroom == 3
                    ? query.where('bedRooms', isEqualTo: 3)
                    : bedroom == 4
                        ? query.where('bedRooms', isEqualTo: 4)
                        : query.where('bedRooms', isEqualTo: 5);
      }

      if (furnishingCount != null && category != 3) {
        query = furnishingCount == 1
            ? query.where('furnishing', isEqualTo: "furnished")
            : furnishingCount == 2
                ? query.where('furnishing', isEqualTo: "semiFurnished")
                : query.where('furnishing', isEqualTo: "unFurnished");
      }

      if (listedByCount != null) {
        query = listedByCount == 1
            ? query.where('listedBy', isEqualTo: "owner")
            : listedByCount == 2
                ? query.where('listedBy', isEqualTo: "dealer")
                : query.where('listedBy', isEqualTo: "builder");
      }

      if (statusCount != null && (category != 3 || category != 6)) {
        query = statusCount == 1
            ? query.where('constructionStatus', isEqualTo: "underConstruction")
            : statusCount == 2
                ? query.where('constructionStatus', isEqualTo: "readyToMove")
                : query.where('constructionStatus', isEqualTo: "newLaunch");
      }

      if (budgetSliderValue != null && budgetSliderValue != 0) {
        log(budgetSliderValue.toInt().toString());
        query = query
            .where('propertyPrice',
                isLessThanOrEqualTo: budgetSliderValue.toInt())
            .orderBy('propertyPrice', descending: true);
      } else {
        query = query.orderBy('createDate', descending: true);
      }
      if (sqPriceSliderValue != null &&
          sqPriceSliderValue != 0 &&
          (category == 1 || category == 2)) {
        query = query
            .where('pricePerstft', isLessThanOrEqualTo: sqPriceSliderValue)
            .orderBy('pricePerstft', descending: true);
      }

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

      final propertyList = snapshot.docs
          .map(
            (e) => PropertyModel.fromSnap(
                e as QueryDocumentSnapshot<Map<String, dynamic>>),
          )
          .toList();
      return right(propertyList);
    } catch (ex) {
      log("Error:$ex");
      return left(MainFailure.noDataFountFailure(errorMsg: ex.toString()));
    }
  }

  void clearData() {
    lastDoc = null;
    noMoreData = false;
  }
}
