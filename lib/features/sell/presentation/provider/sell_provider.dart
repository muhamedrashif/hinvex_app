import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hinvex_app/features/location/data/model/location_model_main.dart/location_model_main.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';
import 'package:hinvex_app/features/sell/data/i_sell_facade.dart';

class SellProvider with ChangeNotifier {
  final ISellFacade iSellFacade;
  SellProvider({required this.iSellFacade});

  final TextEditingController addTitleController = TextEditingController();
  final TextEditingController bathRoomController = TextEditingController();
  final TextEditingController bedRoomController = TextEditingController();
  final TextEditingController bHKController = TextEditingController();
  final TextEditingController breadthController = TextEditingController();
  final TextEditingController carParkingController = TextEditingController();
  final TextEditingController carpetAreaController = TextEditingController();
  final TextEditingController constructionStatusController =
      TextEditingController();
  final TextEditingController describeController = TextEditingController();
  final TextEditingController floorNoController = TextEditingController();
  final TextEditingController furnishingController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController listedByController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController plotAreaController = TextEditingController();
  final TextEditingController pricePersqftController = TextEditingController();
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController superBuilupAreaController =
      TextEditingController();
  final TextEditingController totalFloorsController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController washRoomController = TextEditingController();
  PlaceCell? placeCellUploadLocation;

  List<PlaceResult> suggestions = [];

  // SEARCH LOCATION

  Future<void> getLocations(String query) async {
    final reult = await iSellFacade.pickLocationFromSearch(query);
    reult.fold(
      (l) => null,
      (r) {
        suggestions = r;
        notifyListeners();
      },
    );
  }

  Future<void> searchLocationByAddress({
    required String latitude,
    required String longitude,
    required Function(PlaceCell) onSuccess,
    required VoidCallback onFailure,
  }) async {
    final result = await iSellFacade.serchLocationByAddres(
      latitude: latitude,
      longitude: longitude,
    );

    result.fold(
      (error) {
        onFailure();
      },
      (location) async {
        log('searchLocationByAddress success');
        onSuccess(location);
        notifyListeners();
      },
    );
  }

  void clearSuggestions() {
    suggestions.clear();
    notifyListeners();
  }
}
