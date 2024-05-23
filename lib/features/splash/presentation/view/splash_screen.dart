import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/presentation/provider/auth_provider.dart';
import 'package:hinvex_app/features/authentication/presentation/view/cheking_screen.dart';
import 'package:hinvex_app/features/banner/presentation/provider/banner_provider.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/text_widget.dart';
import 'package:hinvex_app/general/di/injection.dart';
import 'package:hinvex_app/general/services/dynamic_link_services.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:provider/provider.dart';

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
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const InitializerWidget(),
        ),
      );
    });
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                  child: TextWidget(
                    text: "Your Key To Real Estate Excellence",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    textColor: AppColors.titleTextColor,
                    alignment: Alignment.center,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
