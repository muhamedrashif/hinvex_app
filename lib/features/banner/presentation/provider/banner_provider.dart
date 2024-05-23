import 'package:flutter/material.dart';
import 'package:hinvex_app/features/banner/data/i_banner_facade.dart';
import 'package:hinvex_app/features/banner/data/model/banner_model.dart';

class BannerProvider with ChangeNotifier {
  final IBannerFacade iBannerFacade;
  BannerProvider({required this.iBannerFacade});

  bool fetchBannerloading = false;
  List<BannerModel> bannerList = [];

  // FETCH MOBILE BANNER

  Future<void> fetchMobileBanners() async {
    fetchBannerloading = true;
    notifyListeners();
    final result = iBannerFacade.fetchMobileBanners();
    result.listen((event) {
      bannerList = [...event.docs.map((e) => e.data())];
      fetchBannerloading = false;
      notifyListeners();
    });
  }
}
