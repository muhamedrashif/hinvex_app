import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/home/data/i_home_facade.dart';
import 'package:hinvex_app/features/home/data/model/banner_model.dart';

class HomeProvider with ChangeNotifier {
  final IHomeFacade iHomeFacade;

  HomeProvider({required this.iHomeFacade});

  bool fetchBannerLoading = false;
  List<BannerModel> bannerList = [];

  // FETCH BANNER
  Future<void> fetchMobileBanners() async {
    log("FETCH BANNER CALLED");
    fetchBannerLoading = true;
    notifyListeners();
    final result = await iHomeFacade.fetchMobileBanners();
    if (result.docs.isNotEmpty) {
      bannerList = result.docs.map((doc) => BannerModel.fromSnap(doc)).toList();
    } else {
      bannerList = [];
    }
    fetchBannerLoading = false;
    notifyListeners();
  }

  Future<void> init() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchMobileBanners();
    });
  }
}
