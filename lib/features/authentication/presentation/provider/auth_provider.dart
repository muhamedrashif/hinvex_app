import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/data/i_auth_facade.dart';
import 'package:hinvex_app/features/authentication/data/model/user_details_model.dart';
import 'package:hinvex_app/features/location/presentation/provider/location_provider.dart';
import 'package:hinvex_app/general/utils/toast/toast.dart';
import 'package:provider/provider.dart';

class AuthenticationProvider with ChangeNotifier {
  final IAuthFacade iAuthFacade;
  AuthenticationProvider({required this.iAuthFacade});

  UserModel? userModel;

  bool updateLoading = false;

  Timer? timer;
  int countDown = 59;
  bool canResend = false;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countDown > 0) {
        countDown = countDown - 1;
      } else {
        canResend = true;
        timer.cancel();
      }
      notifyListeners();
    });
  }

  void resendOtp() {
    if (canResend) {
      countDown = 59;
      canResend = false;
      startTimer();
    }
  }

  void verifyPhoneNumber({
    required String phoneNumber,
    required VoidCallback onSuccess,
    required void Function(String value) onFailure,
  }) {
    iAuthFacade
        .verifyPhoneNumber(
      phoneNumber,
    )
        .listen((event) {
      event.fold(
        (l) {
          onFailure(l.errorMsg);
        },
        (sucess) {
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
    required void Function(String value) onFailure,
  }) {
    iAuthFacade
        .verifySmsCode(
      smsCode: smsCode,
    )
        .then((event) {
      event.fold(
        (l) {
          onFailure(l.errorMsg);
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

  Future signOut(BuildContext context) async {
    final result = await iAuthFacade.signOut();
    result.fold(
      (l) {
        showToast(l.errorMsg, backgroundColor: Colors.red);
      },
      (r) {
        userModel = null;
        context.read<LocationProvider>().clearLocation();
        notifyListeners();
      },
    );
  }

  void clearData() {
    iAuthFacade.clearData();
  }
}
