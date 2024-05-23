import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hinvex_app/features/authentication/data/i_auth_facade.dart';
import 'package:hinvex_app/features/authentication/data/model/user_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider with ChangeNotifier {
  final IAuthFacade iAuthFacade;
  AuthenticationProvider({required this.iAuthFacade});

  String? verificationId;

  SharedPreferences? _prefs;

  UserModel? userModel;
  bool fetchUserIsLoading = false;
  bool updateLoading = false;

  Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void verifyPhoneNumber({
    required String phoneNumber,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) {
    iAuthFacade.verifyPhoneNumber(phoneNumber).listen((event) {
      event.fold(
        (l) {
          onFailure();
        },
        (r) {
          verificationId = r;
          notifyListeners();
          onSuccess();
        },
      );
    });
  }

  void verifySmsCode({
    required String phoneNumber,
    required String smsCode,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) {
    iAuthFacade
        .verifySmsCode(
      smsCode: smsCode,
      verificationId: verificationId!,
    )
        .then((event) {
      event.fold(
        (l) {
          onFailure();
        },
        (r) {
          _savePhoneNumberLocally(phoneNumber);
          notifyListeners();
          onSuccess();
        },
      );
    });
  }

  Future fetchUser() async {
    fetchUserIsLoading = true;
    notifyListeners();
    log('called provider');
    final result = iAuthFacade.fetchUser();

    result.listen((event) {
      userModel = event;
      fetchUserIsLoading = false;
      notifyListeners();
    });
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    userModel = null;
    notifyListeners();
  }
  // // Function to save phone number locally using SharedPreferences
  // void _savePhoneNumberLocally(String phoneNumber) {
  //   log("SHAREDPREFERENCES CALLED");
  //   _prefs!.setString('phone_number', phoneNumber);
  // }

  void _savePhoneNumberLocally(String phoneNumber) {
    log("SHAREDPREFERENCES CALLED");
    if (_prefs != null) {
      _prefs!.setString('phone_number', phoneNumber);
    } else {
      // Handle the case where _prefs is null, maybe by logging an error or throwing an exception
      log("SharedPreferences instance is null");
      // Alternatively, you can initialize SharedPreferences here
      // initSharedPreferences().then((_) {
      //   _prefs!.setString('phone_number', phoneNumber);
      // });
    }
  }

  // Function to retrieve phone number from SharedPreferences
  // Future<String?> getSavedPhoneNumber() async {
  //   await initSharedPreferences();
  //   return _prefs!.getString('phone_number');
  // }
}
