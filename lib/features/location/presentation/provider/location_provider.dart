import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hinvex_app/features/location/data/i_location_facade.dart';
import 'package:hinvex_app/features/location/data/model/location_model_main.dart/location_model_main.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationProvider with ChangeNotifier {
  final ILocationFacade iLocationFacade;
  LocationProvider({required this.iLocationFacade});

  List<PlaceResult> suggestions = [];
  SharedPreferences? _prefs;

  Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

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

  Future<void> searchLocationByAddress({
    required String latitude,
    required String longitude,
    required Function(PlaceCell) onSuccess,
    required VoidCallback onFailure,
  }) async {
    final result = await iLocationFacade.serchLocationByAddres(
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
        _saveLocationInSharedPreferences(location);
        notifyListeners();
      },
    );
  }

  Future<void> getUserCurrentPosition({
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    iLocationFacade.getUserCurrentPosition().listen((event) {
      event.fold((l) {
        log(l.toString());
        onFailure();
      }, (r) {
        onSuccess();
      });
    }, onError: (error) {
      log(error.toString());
    });
  }

  void _saveLocationInSharedPreferences(PlaceCell location) {
    log("SHAREDPREFERENCES CALLED");
    _prefs!.setString('save_location', location.localArea!);
  }

  Future<String?> getSavedLocation() async {
    await initSharedPreferences();
    return _prefs!.getString('save_location');
  }

  void clearSuggestions() {
    suggestions.clear();
    notifyListeners();
  }
}
