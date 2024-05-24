import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/location/data/i_location_facade.dart';
import 'package:hinvex_app/features/location/data/model/location_model_main.dart/location_model_main.dart';
import 'package:hinvex_app/features/location/data/model/popular_cities_model/popularcities_model.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationProvider with ChangeNotifier {
  final ILocationFacade iLocationFacade;
  LocationProvider({required this.iLocationFacade});

  List<PlaceResult> suggestions = [];

  PlaceCell? currentPlaceCell;
  String? currentPlace;
  SharedPreferences? _prefs;

  Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

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
        notifyListeners();
      },
    );
  }

  Future<void> getUserCurrentPosition({
    required VoidCallback onSuccess,
    required void Function(String) onFailure,
  }) async {
    iLocationFacade.getUserCurrentPosition().listen((event) {
      event.fold((l) {
        log(l.toString());
        onFailure(l.errorMsg);
      }, (placeCell) {
        currentPlaceCell = placeCell;
        saveLocationInSharedPreferences(placeCell);
        notifyListeners();
        onSuccess();
      });
    }, onError: (error) {
      log(error.toString());
    });
  }

  List<PopularCitiesModel> popularcitiesList = [];
  bool popularcitiesIsLoading = false;
  Future fetchPopularCities() async {
    popularcitiesList.clear();
    popularcitiesIsLoading = true;
    notifyListeners();
    final result = await iLocationFacade.fetchPopularCities();
    result.fold((l) => null,
        (r) => popularcitiesList.addAll(r as Iterable<PopularCitiesModel>));
    popularcitiesIsLoading = false;
    notifyListeners();
  }

  void saveLocationInSharedPreferences(PlaceCell location) async {
    _prefs = await SharedPreferences.getInstance();
    log("SHAREDPREFERENCES CALLED");
    if (_prefs != null) {
      if (location.localArea != null) {
        _prefs!.setString('save_location', location.localArea!);
        currentPlace = location.localArea.toString();
        log("LOCATION : $currentPlace + ${location.localArea}");
      } else {
        _prefs!.setString('save_location', location.district);
        currentPlace = location.district.toString();
        log("LOCATION : $currentPlace + ${location.district}");
      }
    }
  }

  Future<void> getSavedLocation() async {
    await initSharedPreferences();
    if (_prefs?.containsKey("save_location") != null) {
      currentPlace = _prefs!.getString('save_location');
    }
    notifyListeners();
  }

  void clearSuggestions() {
    suggestions.clear();
    notifyListeners();
  }

  void selectPlaceCell(PlaceCell placeCell) {
    currentPlaceCell = placeCell;
    notifyListeners();
  }
}
