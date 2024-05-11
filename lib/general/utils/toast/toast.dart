import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    textColor: Colors.white,
    fontSize: 16.0,
    backgroundColor: AppColors.textButtonColor,
  );
}
