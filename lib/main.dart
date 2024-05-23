import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/data/i_auth_facade.dart';
import 'package:hinvex_app/features/authentication/presentation/provider/auth_provider.dart';
import 'package:hinvex_app/features/banner/data/i_banner_facade.dart';
import 'package:hinvex_app/features/banner/presentation/provider/banner_provider.dart';
import 'package:hinvex_app/features/category/presentation/provider/category_filter_provider.dart';
import 'package:hinvex_app/features/home/data/i_home_facade.dart';
import 'package:hinvex_app/features/home/presentation/provider/home_provider.dart';
import 'package:hinvex_app/features/location/data/i_location_facade.dart';
import 'package:hinvex_app/features/location/presentation/provider/location_provider.dart';
import 'package:hinvex_app/features/myads/data/i_myads_facade.dart';
import 'package:hinvex_app/features/myads/presentation/provider/myads_provider.dart';
import 'package:hinvex_app/features/profile/data/i_profile_facade.dart';
import 'package:hinvex_app/features/profile/presentation/provider/profile_provider.dart';
import 'package:hinvex_app/features/property_details_view/data/i_propertydetails_facade.dart';
import 'package:hinvex_app/features/property_details_view/presentation/provider/propertydertails_provider.dart';
import 'package:hinvex_app/features/sell/data/i_sell_facade.dart';
import 'package:hinvex_app/features/sell/presentation/provider/sell_provider.dart';
import 'package:hinvex_app/features/shortlists/data/i_shortlist_facade.dart';
import 'package:hinvex_app/features/shortlists/presentation/provider/shortlist_provider.dart';
import 'package:hinvex_app/general/di/injection.dart';
import 'package:hinvex_app/general/utils/app_details.dart';
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
          create: (context) =>
              AuthenticationProvider(iAuthFacade: sl<IAuthFacade>()),
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
        ChangeNotifierProvider(
          create: (_) => MyAdsProvider(iMyAdsFacade: sl<IMyAdsFacade>()),
        ),
        ChangeNotifierProvider(
          create: (_) => PropertyDetailsProvider(
              iPropertyDetailsFacade: sl<IPropertyDetailsFacade>()),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(iHomeFacade: sl<IHomeFacade>()),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryFilterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              ShortListProvider(iShortListFacade: sl<IShortListFacade>()),
        ),
        ChangeNotifierProvider(
          create: (_) => BannerProvider(iBannerFacade: sl<IBannerFacade>()),
        )
      ],
      child: MaterialApp(
        title: AppDetails.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
