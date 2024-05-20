import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hinvex_app/features/location/data/model/location_model_main.dart/location_model_main.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';
import 'package:hinvex_app/features/myads/presentation/provider/myads_provider.dart';
import 'package:hinvex_app/features/sell/data/i_sell_facade.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/services/multi_image_pick_service.dart';
import 'package:hinvex_app/general/utils/enums/enums.dart';
import 'package:provider/provider.dart';

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
  List<String> imageUrl = [];
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

  Future<void> getUserCurrentPosition({
    required Function(PlaceCell) onSuccess,
    required VoidCallback onFailure,
  }) async {
    iSellFacade.getUserCurrentPosition().listen((event) {
      event.fold((l) {
        log(l.toString());
        onFailure();
      }, (r) {
        onSuccess(r);
      });
    }, onError: (error) {
      log(error.toString());
    });
  }

  // GET IMAGE

  Future<void> getImage({
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    final result = await pickMultipleImages(7 - imageUrl.length);

    result.fold((l) {
      onFailure();
    }, (r) {
      if (r.isNotEmpty) {
        imageUrl.addAll(r);
      }
      onSuccess();
      notifyListeners();
    });
    log("imageUrl::::::::::::${imageUrl.toString()}");
    log("imageUrl length::::::::::::${imageUrl.length}");
    notifyListeners();
  }

  // Method to remove image based on index
  void removeImageAtIndex(int index) async {
    await deleteUrl(url: imageUrl[index]);

    if (index >= 0 && index < imageUrl.length) {
      imageUrl.removeAt(index);

      notifyListeners();
    }
  }

  // STORE PROPERTY TO FIRESTORE

  Future<void> uploadPropertyToFireStore(
      {required BuildContext context,
      required PropertyModel propertyModel,
      required VoidCallback onSuccess,
      required VoidCallback onFailure}) async {
    sendLoading = true;
    notifyListeners();
    log("propertyModel ${propertyModel.toString()}");
    final result = await iSellFacade.uploadPropertyToFireStore(
      propertyModel: propertyModel,
    );
    result.fold((error) {
      log(error.errorMsg);
      onFailure();
    }, (success) {
      log("-###------------${success.propertyImage!.toString()}--------------${success.propertyImage!.length.toString()}");

      context.read<MyAdsProvider>().addLocalyToMyAds(success);
      sendLoading = false;
      notifyListeners();
      onSuccess.call();
    });
  }
// EDIT PROPERTY

  Future<void> updateUploadedPosts({
    required BuildContext context,
    required PropertyModel propertyModel,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    updateLoading = true;
    notifyListeners();
    final result = await iSellFacade.updateUploadedPosts(propertyModel);
    result.fold((error) {
      log(error.errorMsg);
    }, (success) {
      updateLoading = false;
      context.read<MyAdsProvider>().updateMyads(propertyModel);
      notifyListeners();
      onSuccess.call();
    });
  }

  void editPost({PropertyModel? editProperty}) {
    addTitleController.text = editProperty!.propertyTitle!;
    bHKController.text = editProperty.bhk.toString();
    bathRoomController.text = editProperty.bathRooms.toString();
    bedRoomController.text = editProperty.bedRooms.toString();
    breadthController.text = editProperty.plotBreadth.toString();
    carParkingController.text = editProperty.carParking.toString();
    constructionStatusController.text =
        editProperty.getConstructionStatusString;
    carpetAreaController.text = editProperty.carpetAreaft.toString();
    describeController.text = editProperty.propertyDetils!;
    descriptionController.text = editProperty.description!;
    floorNoController.text = editProperty.floorNo.toString();
    furnishingController.text = editProperty.getSelectedFurnisherString;
    lengthController.text = editProperty.plotLength.toString();
    listedByController.text = editProperty.getSelectedListedByString;
    locationController.text = editProperty.propertyLocation!.localArea!;
    placeCellUploadLocation = editProperty.propertyLocation;
    plotAreaController.text = editProperty.plotArea.toString();
    priceController.text = editProperty.propertyPrice.toString();
    pricePersqftController.text = editProperty.pricePerstft.toString();
    projectNameController.text = editProperty.projectName!;
    selectedBHKValue = editProperty.bhk;
    selectedCategory = editProperty.propertyCategory;
    superBuilupAreaController.text = editProperty.superBuiltupAreaft.toString();
    totalFloorsController.text = editProperty.totalFloors.toString();
    typeController.text = editProperty.getSelectedTypeString;
    washRoomController.text = editProperty.washRoom.toString();

    notifyListeners();
  }

  void clearSuggestions() {
    suggestions.clear();
    notifyListeners();
  }

  void clearData() {
    addTitleController.clear();
    bHKController.clear();
    bathRoomController.clear();
    bedRoomController.clear();
    breadthController.clear();
    carParkingController.clear();
    constructionStatusController.clear();
    carpetAreaController.clear();
    describeController.clear();
    descriptionController.clear();
    floorNoController.clear();
    furnishingController.clear();
    lengthController.clear();
    listedByController.clear();
    locationController.clear();
    placeCellUploadLocation = null;
    plotAreaController.clear();
    priceController.clear();
    pricePersqftController.clear();
    projectNameController.clear();
    selectedBHKValue = 0;
    selectedCategory = null;
    superBuilupAreaController.clear();
    totalFloorsController.clear();
    typeController.clear();
    washRoomController.clear();
    notifyListeners();
  }
}
