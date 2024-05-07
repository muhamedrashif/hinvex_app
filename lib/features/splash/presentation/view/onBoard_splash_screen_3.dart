import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/presentation/view/authentocation_screen.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/skip_button_widget.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/text_widget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

import 'widgets/custom_button_widget.dart';

class OnBoardSplashScreen3 extends StatefulWidget {
  const OnBoardSplashScreen3({super.key});

  @override
  State<OnBoardSplashScreen3> createState() => _OnBoardSplashScreen3State();
}

class _OnBoardSplashScreen3State extends State<OnBoardSplashScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustumImage(
            image: ImageConstant.hinvexAppLogo,
            height: 21.85,
            width: 100,
          ),
          const SizedBox(
            height: 30,
          ),
          CustumImage(
            image: ImageConstant.onBoard3,
            height: 183.29,
            width: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          TextWidget(
              alignment: Alignment.centerLeft,
              text: "You Can Filter Your\nSelection",
              fontWeight: FontWeight.bold,
              fontSize: 23,
              textColor: AppColors.titleTextColor),
          const TextWidget(
              alignment: Alignment.centerLeft,
              text:
                  "You Possess the Ability to Refine and\nCustomize Your Selection According to\nSpecific Criteria and Preferences. Explore and\nTailor Your Choices",
              fontWeight: FontWeight.w500,
              fontSize: 13,
              textColor: Colors.grey),
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButtonWidget(
                      height: 48.0,
                      width: 220.0,
                      buttonColor: AppColors.textButtonColor,
                      text: "Next",
                      textColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AuthenticationScreen(),
                            ));
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SkipButton(
                      height: 48,
                      width: 52,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AuthenticationScreen(),
                            ));
                      },
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
