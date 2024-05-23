import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/home/data/i_home_facade.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';

class HomeProvider with ChangeNotifier {
  final IHomeFacade iHomeFacade;

  HomeProvider({required this.iHomeFacade});

  late PlaceCell placeCell;

  List<PropertyModel> propertyList = [];

  bool fetchProductsLoading = true;
  final scrollController = ScrollController();

  Future<void> fetchProducts() async {
    fetchProductsLoading = true;
    notifyListeners();
    final result = await iHomeFacade.fetchProduct(placeCell);
    result.fold(
      (error) {
        log(error.errorMsg);
        fetchProductsLoading = false;
        notifyListeners();
      },
      (success) {
        propertyList.addAll(success);
        fetchProductsLoading = false;
        notifyListeners();
      },
    );
  }

  Future<void> init() async {
    if (propertyList.isEmpty) {
      iHomeFacade.clearData();
      propertyList = [];
      await fetchProducts();
    }
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent != 0 &&
          scrollController.position.atEdge &&
          fetchProductsLoading == false) {
        fetchProducts();
      }
    });
  }

  Future<void> fetchUserLocations(BuildContext context) async {
    // iHomeFacade.fecthUserLocaltion()
  }
}
