import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/data/model/user_details_model.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/features/shortlists/data/i_shortlist_facade.dart';
import 'package:hinvex_app/general/utils/toast/toast.dart';

class ShortListProvider with ChangeNotifier {
  final IShortListFacade iShortListFacade;
  ShortListProvider({required this.iShortListFacade});

  ScrollController scrollController = ScrollController();
  List<PropertyModel> propertiesList = [];
  bool isLoading = false;

  void uploadShortList(PropertyModel propertyModel, UserModel userModel) async {
    final upload =
        await iShortListFacade.uploadShortListItem(propertyModel, userModel);
    upload.fold((l) => showToast(l.errorMsg), (r) {});
    notifyListeners();
  }

  Future<void> fetchFavoritePosts(List<String> productIds) async {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
    final data = await iShortListFacade.fetchFavoritePosts(productIds);
    data.fold((l) {
      log(l.errorMsg);
      isLoading = false;
      notifyListeners();
      showToast(
        l.errorMsg,
      );
    }, (datas) {
      log("DATA LENGTH:${datas.length}");
      if (datas.isNotEmpty) {
        propertiesList.addAll(datas);
      }

      log("PROPERTI LENGTH:${datas.length}");
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> init(List<String> productIds) async {
    iShortListFacade.clearData();
    propertiesList = [];
    notifyListeners();
    fetchFavoritePosts(productIds);

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent != 0 &&
          scrollController.position.atEdge &&
          isLoading == false) {
        fetchFavoritePosts(productIds);
      }
    });
  }
}
