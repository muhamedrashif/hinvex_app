import 'dart:developer';
import 'dart:io';

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
  String? imageUrl;
  File? imageFile;
  bool saveImageloading = false;

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

  // GET IMAGE

  Future<void> getImage({
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    final result = await iProfileFacade.getImage();
    result.fold((error) {
      log("Fialed To Pick Image $error");
      onFailure;
    }, (success) {
      imageFile = success;
      notifyListeners();
      onSuccess;
    });
    notifyListeners();
  }

  Future saveImage({
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    // log(imageFile.toString());
    saveImageloading = true;
    notifyListeners();
    final result = await iProfileFacade.saveImage(imageFile: imageFile!);
    result.fold((error) {
      log(error.errorMsg);
      onFailure;
      saveImageloading = false;
    }, (success) {
      log(success);
      imageUrl = success;

      notifyListeners();

      onSuccess;
    });
    saveImageloading = false;
    notifyListeners();
  }

  void clearSuggestions() {
    suggestions.clear();
    notifyListeners();
  }

  void clearImage() {
    imageFile = null;
    imageUrl = null;
    notifyListeners();
  }
}
