import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hinvex_app/features/authentication/data/i_auth_facade.dart';

class AuthProvider with ChangeNotifier {
  AuthProvider(this.iAuthFacade);

  final IAuthFacade iAuthFacade;

  String? verificationId;

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
          onSuccess();
        },
      );
    });
  }
}
