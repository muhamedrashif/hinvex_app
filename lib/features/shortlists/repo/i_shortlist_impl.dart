import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/data/model/user_details_model.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/features/shortlists/data/i_shortlist_facade.dart';
import 'package:hinvex_app/general/failures/exeception/execeptions.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IShortListFacade)
class IShortListImpl implements IShortListFacade {
  IShortListImpl(
    this._firestore,
  );
  final FirebaseFirestore _firestore;
  int currentIndex = 0;
  int currentLastIndex = 0;
  bool noMoreData = false;

  @override
  FutureResult<void> uploadShortListItem(
    PropertyModel propertyModel,
    UserModel userModel,
  ) async {
    try {
      debugPrint("Updating shortList in Firestore with ID: ${userModel.id}");
      final batch = _firestore.batch();
      if (userModel.favoriteProducts!.contains(propertyModel.id)) {
        batch.update(
          _firestore.collection('users').doc(userModel.id),
          {
            "favoriteProducts": FieldValue.arrayRemove([propertyModel.id]),
          },
        );
        batch.update(
          _firestore.collection('posts').doc(propertyModel.id),
          {
            "favorites": FieldValue.increment(-1),
          },
        );
      } else {
        batch.update(
          _firestore.collection('users').doc(userModel.id),
          {
            "favoriteProducts": FieldValue.arrayUnion([propertyModel.id]),
          },
        );
        batch.update(
          _firestore.collection('posts').doc(propertyModel.id),
          {
            "favorites": FieldValue.increment(1),
          },
        );
      }
      await batch.commit();
      return right(null);
    } on CustomExeception catch (e) {
      return left(MainFailure.serverFailure(errorMsg: e.errorMsg));
    }
  }

  @override
  FutureResult<List<PropertyModel>> fetchFavoritePosts(
    List<String> productIds,
  ) async {
    if (noMoreData) return right([]);
    try {
      currentLastIndex += 8;
      List<Future<DocumentSnapshot<Map<String, dynamic>>>> futures = [];

      for (currentIndex; currentIndex < currentLastIndex; currentIndex++) {
        if (currentIndex < productIds.length) {
          futures.add(_firestore
              .collection('posts')
              .doc(productIds[currentIndex])
              .get());
        } else {
          noMoreData = true;
          break;
        }
      }

      final queryDocs = await Future.wait(futures);

      List<PropertyModel> productList = [];

      for (var element in queryDocs) {
        if (element.exists) {
          productList.add(PropertyModel.fromSnap(element));
        }
      }

      return right(productList);
    } catch (ex) {
      return left(MainFailure.serverFailure(errorMsg: ex.toString()));
    }
  }

  @override
  void clearData() {
    currentIndex = 0;
    currentLastIndex = 0;
    noMoreData = false;
  }
}
