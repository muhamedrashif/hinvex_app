import 'package:flutter/material.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_button_widget.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/skip_button_widget.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/text_widget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            TextWidget(
                alignment: Alignment.center,
                text: "Choose Your Location",
                fontWeight: FontWeight.bold,
                fontSize: 18,
                textColor: AppColors.titleTextColor),
            const TextWidget(
                alignment: Alignment.center,
                text:
                    "Select your present location now\n  for optimal interaction with us.",
                fontWeight: FontWeight.w500,
                fontSize: 14,
                textColor: Colors.grey),
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
                text: "Choose Current Location",
                textColor: AppColors.buttonTextColor,
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SkipButton(
                height: 44,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
