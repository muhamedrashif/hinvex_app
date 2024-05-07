import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hinvex_app/features/location/data/i_location_facade.dart';
import 'package:hinvex_app/features/location/data/model/location_model_main.dart/location_model_main.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';

class LocationProvider with ChangeNotifier {
  final ILocationFacade iLocationFacade;
  LocationProvider({required this.iLocationFacade});

  List<PlaceResult> suggestions = [];

  // SEARCH LOCATION

  Future<void> getLocations(String query) async {
    final reult = await iLocationFacade.pickLocationFromSearch(query);
    reult.fold(
      (l) => null,
      (r) {
        suggestions = r;
        notifyListeners();
      },
    );
  }

  Future<void> serchLocationByAddres({
    required String latitude,
    required String longitude,
    required Function(PlaceCell) onSuccess,
    required VoidCallback onFailure,
  }) async {
    final result = await iLocationFacade.serchLocationByAddres(
        latitude: latitude, longitude: longitude);

    await result.fold(
      (l) {
        onFailure();
      },
      (r) async {
        log('serchLocationByAddres success');

        result.fold((l) {
          onFailure();
        }, (_) {
          onSuccess(r);
        });
      },
    );
  }

  Future<void> getUserCurrentPosition() async {
    iLocationFacade.getUserCurrentPosition();
  }

  void clearSuggestions() {
    suggestions.clear();
    notifyListeners();
  }
}
