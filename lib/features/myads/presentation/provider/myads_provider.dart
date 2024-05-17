import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hinvex_app/features/myads/data/i_myads_facade.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';

class MyAdsProvider with ChangeNotifier {
  final IMyAdsFacade iMyAdsFacade;
  MyAdsProvider({required this.iMyAdsFacade});

  List<PropertyModel> myAdsList = [];

  bool fetchProductsLoading = true;
  final scrollController = ScrollController();

  Future<void> fetchProducts() async {
    fetchProductsLoading = true;
    notifyListeners();
    final result = await iMyAdsFacade.fetchProduct();
    result.fold(
      (error) {
        log(error.errorMsg);
        fetchProductsLoading = false;
        notifyListeners();
      },
      (success) {
        myAdsList.addAll(success);
        fetchProductsLoading = false;
        notifyListeners();
      },
    );
  }

  Future deleteUploadedPosts({
    required String id,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    final result = await iMyAdsFacade.deleteUploadedPosts(id);
    result.fold((error) {
      onFailure();
      log(error.errorMsg);
    }, (success) {
      onSuccess.call();
    });
    notifyListeners();
  }

  void removeFromMyAdsList(String id) {
    myAdsList = myAdsList.where((element) => element.id != id).toList();
  }

  Future<void> init() async {
    if (myAdsList.isEmpty) {
      iMyAdsFacade.clearData();
      fetchProducts();
    }

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent != 0 &&
          scrollController.position.atEdge &&
          fetchProductsLoading == false) {
        fetchProducts();
      }
    });
  }
}
