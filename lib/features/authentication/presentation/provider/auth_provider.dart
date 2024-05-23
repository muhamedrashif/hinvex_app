import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/data/i_auth_facade.dart';
import 'package:hinvex_app/features/authentication/data/model/user_details_model.dart';
import 'package:hinvex_app/general/utils/toast/toast.dart';

class AuthenticationProvider with ChangeNotifier {
  final IAuthFacade iAuthFacade;
  AuthenticationProvider({required this.iAuthFacade});

  String? verificationId;

  UserModel? userModel;

  bool updateLoading = false;

  void verifyPhoneNumber({
    required String phoneNumber,
    required VoidCallback onSuccess,
    required void Function(String value) onFailure,
  }) {
    iAuthFacade.verifyPhoneNumber(phoneNumber).listen((event) {
      event.fold(
        (l) {
          onFailure(l.errorMsg);
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
          notifyListeners();
          onSuccess();
        },
      );
    });
  }

  Future fetchUser() async {
    if (FirebaseAuth.instance.currentUser == null) return;
    final result = iAuthFacade.fetchUser();
    result.listen((event) {
      userModel = event;
      notifyListeners();
    });
  }

  Future signOut() async {
    final result = await iAuthFacade.signOut();
    result.fold(
      (l) {
        showToast(l.errorMsg, backgroundColor: Colors.red);
      },
      (r) {
        userModel = null;
        notifyListeners();
      },
    );
  }
}
