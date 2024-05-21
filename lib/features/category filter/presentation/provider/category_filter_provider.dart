import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/category%20filter/repo/i_category_impl.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/utils/toast/toast.dart';

class CategoryFilterProvider extends ChangeNotifier {
  
  bool? isBuy;
  int? bedroomCount;
  int? furnishingCount;
  int? listedByCount;
  int? statusCount;
  double? budgetSliderValue;
  double? sqPriceSliderValue;

 CategoryFilterRepository categoryFilterRepository = CategoryFilterRepository();
  List<PropertyModel> filteredUploadedPropertiesList = [];
  bool isLoading = false;
    final scrollController = ScrollController();

  void isBuyTapped(bool buy) {
    isBuy = buy;
    notifyListeners();
  }

  void isBedroonTapped(int value) {
    bedroomCount = value;
    notifyListeners();
  }

  void isFurnishingTapped(int value) {
    furnishingCount = value;
    notifyListeners();
  }

  void isListedByTapped(int value) {
    listedByCount = value;
    notifyListeners();
  }

  void isStatusTapped(int value) {
    statusCount = value;
    notifyListeners();
  }

  void isBudgetTapped(double value) {
    budgetSliderValue = value;
    notifyListeners();
  }

  void isSqPriceTapped(double value) {
    sqPriceSliderValue = value;
    notifyListeners();
  }

  Future<void> fetchPosts() async {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
    final data = await categoryFilterRepository.fetchFilterPosts(
      isBuy: isBuy, bedroom: bedroomCount, furnishingCount: furnishingCount,
       listedByCount: listedByCount, statusCount: statusCount, 
       budgetSliderValue: budgetSliderValue, sqPriceSliderValue: sqPriceSliderValue);
    data.fold((l) {
        log(l.errorMsg);
        isLoading = false;
        notifyListeners();
        showToast(l.errorMsg,);
     
    }, (datas) {
      filteredUploadedPropertiesList = [...filteredUploadedPropertiesList, ...datas];
      isLoading = false;
      notifyListeners();
    });
  }

    Future<void> init() async {
    if (filteredUploadedPropertiesList.isEmpty) {
      categoryFilterRepository.clearData();
      fetchPosts();
    }

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent != 0 &&
          scrollController.position.atEdge &&
         isLoading==false) {
        fetchPosts();
      }
    });
  }

}
