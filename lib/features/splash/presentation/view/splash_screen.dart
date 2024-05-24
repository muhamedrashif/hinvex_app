import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/presentation/provider/auth_provider.dart';
import 'package:hinvex_app/features/authentication/presentation/view/authentocation_screen.dart';
import 'package:hinvex_app/features/banner/presentation/provider/banner_provider.dart';
import 'package:hinvex_app/features/bottomNavigationBar/presentation/view/bottom_navigation_widget.dart';
import 'package:hinvex_app/features/location/presentation/provider/location_provider.dart';
import 'package:hinvex_app/features/location/presentation/view/location_sreen.dart';
import 'package:hinvex_app/features/onboard/presentation/view/onboard_screen_.dart';

import 'package:hinvex_app/general/utils/image_constants.dart';
import 'package:hinvex_app/general/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BannerProvider>(context, listen: false).fetchMobileBanners();
      Provider.of<AuthenticationProvider>(context, listen: false).fetchUser();
    });
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 5), // Increase duration to slow down the animation
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 1.0,
          curve: Curves
              .easeInOut), // Adjust the interval to control the timing of animation
    ));
    _controller.forward();

    navi();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 39.33,
                width: 180,
                child: Image.asset(
                  ImageConstant.hinvexAppLogo,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Opacity(
                  opacity: _animation.value,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 4.0), // Adjust the top padding as needed
                    child: Text(
                      "Your Key To Real Estate Excellence",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.titleTextColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void navi() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        checkUserAuthenticated();
      },
    );
  }

  Future<void> checkUserAuthenticated() async {
    final placeCell =
        Provider.of<LocationProvider>(context, listen: false).currentPlaceCell;
    if (FirebaseAuth.instance.currentUser == null) {
      checkOnbodingLocalStore();
    } else if (placeCell == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const LocationScreen();
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const BottomNavigationScreen();
          },
        ),
      );
    }
  }

  Future<void> checkOnbodingLocalStore() async {
    final prefs = await SharedPreferences.getInstance();
    bool isCheck = prefs.getBool("isOnBoarded") ?? false;
    if (isCheck) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const AuthenticationScreen();
            },
          ),
        );
      }
    } else {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const OnBoardScreen();
            },
          ),
        );
      }
    }
  }
}
