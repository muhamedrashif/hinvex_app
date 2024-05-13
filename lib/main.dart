import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/data/i_auth_facade.dart';
import 'package:hinvex_app/features/authentication/presentation/provider/auth_provider.dart';
import 'package:hinvex_app/features/location/data/i_location_facade.dart';
import 'package:hinvex_app/features/location/presentation/provider/location_provider.dart';
import 'package:hinvex_app/features/profile/data/i_profile_facade.dart';
import 'package:hinvex_app/features/profile/presentation/provider/profile_provider.dart';
import 'package:hinvex_app/features/sell/data/i_sell_facade.dart';
import 'package:hinvex_app/features/sell/presentation/provider/sell_provider.dart';
import 'package:hinvex_app/general/di/injection.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:provider/provider.dart';

import 'features/splash/presentation/view/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(iAuthFacade: sl<IAuthFacade>()),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              LocationProvider(iLocationFacade: sl<ILocationFacade>()),
        ),
        ChangeNotifierProvider(
          create: (_) => SellProvider(iSellFacade: sl<ISellFacade>()),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(iProfileFacade: sl<IProfileFacade>()),
        ),
      ],
      child: MaterialApp(
        title: 'HinveX App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
