import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hinvex_app/features/authentication/data/model/user_details_model.dart';
import 'package:hinvex_app/features/profile/data/i_profile_facade.dart';

class ProfileProvider with ChangeNotifier {
  final IProfileFacade iProfileFacade;
  ProfileProvider({required this.iProfileFacade});

  bool fetchUserLoading = false;
  List<UserModel> fetchUserList = [];

  // FETCH USER DETAILS
  Future<void> fetchUser() async {
    log("FETCH USER");
    fetchUserLoading = true;
    notifyListeners();
    try {
      final result = await iProfileFacade.fetchUser();
      log(result.docs.length.toString());
      if (result.docs.isNotEmpty) {
        // fetchUserList = [...UserModel.fromSnap(result.docs.map((e) => e))];
        fetchUserList = result.docs
            .map((e) => UserModel.fromSnap(e as Map<String, dynamic>))
            .toList();
      } else {
        fetchUserList = [];
      }
      fetchUserLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error fetching user: $e');
      fetchUserLoading = false;
      notifyListeners();
    }
  }
}
