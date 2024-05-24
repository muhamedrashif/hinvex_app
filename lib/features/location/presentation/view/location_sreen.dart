import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hinvex_app/features/authentication/presentation/provider/auth_provider.dart';
import 'package:hinvex_app/features/bottomNavigationBar/presentation/view/bottom_navigation_widget.dart';
import 'package:hinvex_app/features/location/presentation/provider/location_provider.dart';
import 'package:hinvex_app/features/location/presentation/view/widgets/search_location_widget.dart';
import 'package:hinvex_app/general/widgets/custom_button_widget.dart';
import 'package:hinvex_app/general/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/widgets/custom_outLines_button_widget.dart';

import 'package:hinvex_app/general/utils/image_constants.dart';
import 'package:hinvex_app/general/utils/colors.dart';
import 'package:hinvex_app/general/utils/progress_indicator_widget/progress_indicator_widget.dart';
import 'package:hinvex_app/general/utils/toast/toast.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AuthenticationProvider>(context, listen: false).fetchUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustumImage(
              image: ImageConstant.hinvexAppLogo,
              height: 21.85,
              width: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Choose Your Location",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.titleTextColor,
              ),
            ),
            const Text(
              "Select your present location now\n  for optimal interaction with us.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 30,
            ),
            CustumImage(
              image: ImageConstant.currentLocation,
              height: 197.79,
              width: 250,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButtonWidget(
                height: 44,
                width: MediaQuery.of(context).size.width,
                buttonColor: AppColors.textButtonColor,
                icon: Icons.location_on_outlined,
                text: "Choose Current Location",
                textColor: AppColors.buttonTextColor,
                onTap: () {
                  showProgress(context);
                  context.read<LocationProvider>().getUserCurrentPosition(
                      onSuccess: () {
                    log("Get current location Success");
                    Navigator.pop(context);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavigationScreen(),
                        ),
                        (route) => false);
                  }, onFailure: (failed) {
                    log("Get current location Failed");
                    showToast(failed, backgroundColor: Colors.red);

                    Navigator.pop(context);
                    Geolocator.openAppSettings();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomOutLineButtonWidget(
                height: 44,
                width: MediaQuery.of(context).size.width,
                text: "Other Location",
                textColor: AppColors.titleTextColor,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchLocationWidget(),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
