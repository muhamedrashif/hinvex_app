import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/data/model/user_details_model.dart';
import 'package:hinvex_app/features/property_details_view/data/i_propertydetails_facade.dart';

class PropertyDetailsProvider with ChangeNotifier {
  final IPropertyDetailsFacade iPropertyDetailsFacade;

  PropertyDetailsProvider({required this.iPropertyDetailsFacade});

  bool fetchUserLoading = false;
  UserModel? userModel;

  // FETCH USER DETAILS
  Future<void> fetchUser({required String userId}) async {
    log("FETCH USER DETAILS CALLED");
    fetchUserLoading = true;
    notifyListeners();
    final result = await iPropertyDetailsFacade.fetchUser(userId);
    if (result.docs.isNotEmpty) {
      userModel = UserModel.fromSnap(result.docs.first);
    } else {
      userModel = null;
    }
    fetchUserLoading = false;
    notifyListeners();
  }
}
