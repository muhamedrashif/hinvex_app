import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hinvex_app/features/edit_Uploaded_Property/data/i_edit_facade.dart';
import 'package:hinvex_app/features/location/data/model/location_model_main.dart/location_model_main.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/services/multi_image_pick_service.dart';
import 'package:hinvex_app/general/utils/enums/enums.dart';

class EditPropertProvider with ChangeNotifier {
  final IEditPropertyFacade iEditPropertyFacade;

  EditPropertProvider({required this.iEditPropertyFacade});

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
  final TextEditingController descriptionController = TextEditingController();
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
  final TextEditingController priceController = TextEditingController();

  PlaceCell? placeCellUploadLocation;
  SelectedCategory? selectedCategory;
  int? selectedBHKValue;

  List<PlaceResult> suggestions = [];
  bool sendLoading = false;
  bool updateLoading = false;
  List<String> imageFile = [];

  // SEARCH LOCATION

  Future<void> getLocations(String query) async {
    final reult = await iEditPropertyFacade.pickLocationFromSearch(query);
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
    final result = await iEditPropertyFacade.serchLocationByAddres(
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
  // GET IMAGE

  Future<void> getImage({
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    final result = await pickMultipleImages(7 - imageFile.length);

    result.fold((l) {
      onFailure();
    }, (r) {
      if (r.isNotEmpty) {
        imageFile.addAll(r);
      }
      onSuccess();
      notifyListeners();
    });
    log("imageFile::::::::::::${imageFile.toString()}");
    log("imageFile length::::::::::::${imageFile.length}");
    notifyListeners();
  }

  // Method to remove image based on index
  void removeImageAtIndex(int index) async {
    await deleteUrl(url: imageFile[index]);

    if (index >= 0 && index < imageFile.length) {
      imageFile.removeAt(index);

      notifyListeners();
    }
  }

  Future<void> updateUploadedPosts({
    required PropertyModel propertyModel,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    updateLoading = true;
    notifyListeners();
    final result = await iEditPropertyFacade.editProperty(propertyModel);
    result.fold((error) {
      log(error.errorMsg);
    }, (success) {
      updateLoading = false;

      notifyListeners();
      onSuccess.call();
    });
  }

  void clearSuggestions() {
    suggestions.clear();
    notifyListeners();
  }
}
