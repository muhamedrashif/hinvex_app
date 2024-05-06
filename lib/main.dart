import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hinvex_app/general/di/injection.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

import 'features/splash/presentation/view/splash_screen.dart';

Future<void> main() async {
  await configureDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HinveX App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
