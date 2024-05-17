import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hinvex_app/features/myads/data/i_myads_facade.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';

class MyAdsProvider with ChangeNotifier {
  final IMyAdsFacade iMyAdsFacade;
  MyAdsProvider({required this.iMyAdsFacade});

  List<PropertyModel> filteredUploadedPropertiesList = [];

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
        filteredUploadedPropertiesList.addAll(success);
        fetchProductsLoading = false;
        notifyListeners();
      },
    );
  }

  Future<void> init() async {
    if (filteredUploadedPropertiesList.isEmpty) {
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
