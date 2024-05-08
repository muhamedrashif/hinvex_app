import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hinvex_app/features/authentication/data/i_auth_facade.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final IAuthFacade iAuthFacade;
  AuthProvider({required this.iAuthFacade});

  String? verificationId;

  SharedPreferences? _prefs;

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

  // Function to save phone number locally using SharedPreferences
  void _savePhoneNumberLocally(String phoneNumber) {
    log("SHAREDPREFERENCES CALLED");
    _prefs!.setString('phone_number', phoneNumber);
  }

  // Function to retrieve phone number from SharedPreferences
  Future<String?> getSavedPhoneNumber() async {
    await initSharedPreferences();
    return _prefs!.getString('phone_number');
  }
}
