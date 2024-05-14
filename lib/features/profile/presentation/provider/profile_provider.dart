import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hinvex_app/features/authentication/data/model/user_details_model.dart';
import 'package:hinvex_app/features/location/data/model/location_model_main.dart/location_model_main.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';
import 'package:hinvex_app/features/profile/data/i_profile_facade.dart';

class ProfileProvider with ChangeNotifier {
  final IProfileFacade iProfileFacade;
  ProfileProvider({required this.iProfileFacade});

  List<PlaceResult> suggestions = [];
  bool updateLoading = false;
  PlaceCell? placeCellUserUpdatedLocation;
  UserModel? userModel;
  // FETCH USER DETAILS

  // Future<void> fetchUser() async {
  //   log("Fetching user data...");
  //   fetchUserLoading = true;
  //   notifyListeners();

  //   final result = await iProfileFacade.fetchUser();
  //   log("Fetched ${result.docs.length} user(s) from Firestore");
  //   if (result.docs.isNotEmpty) {
  //     // fetchUserList =
  //     //     result.docs.map((e) => UserModel.fromSnap(e.data())).toList();
  //     log("Fetched user data: $fetchUserList");
  //     fetchUserLoading = false;
  //     notifyListeners();
  //   } else {
  //     fetchUserList = [];
  //   }
  //   fetchUserLoading = false;
  //   notifyListeners();
  // }

  // SEARCH LOCATION

  Future<void> getLocations(String query) async {
    final reult = await iProfileFacade.pickLocationFromSearch(query);
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
    final result = await iProfileFacade.serchLocationByAddres(
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

  Future<void> updateUserDetils({
    required UserModel userModel,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    updateLoading = true;
    notifyListeners();
    final result = await iProfileFacade.updateUserDetils(userModel);
    result.fold((error) {
      log(error.errorMsg);
    }, (success) {
      updateLoading = false;
      // fetchUserList[fetchUserList
      //     .indexWhere((element) => element.id == userModel.id)] = userModel;

      notifyListeners();
      onSuccess.call();
    });
  }

  void clearSuggestions() {
    suggestions.clear();
    notifyListeners();
  }
}
