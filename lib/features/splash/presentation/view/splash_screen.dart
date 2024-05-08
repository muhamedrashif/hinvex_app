import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

import 'onBoard_splash_screen_1.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const OnBoardSplashScreen1(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 39.33,
                  width: 180,
                  child: Image.asset(
                    ImageConstant.hinvexAppLogo,
                    fit: BoxFit.contain,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
