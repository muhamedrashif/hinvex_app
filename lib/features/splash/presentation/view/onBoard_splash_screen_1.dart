import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/presentation/view/authentocation_screen.dart';
import 'package:hinvex_app/features/splash/presentation/view/onBoard_splash_screen_2.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/skip_button_widget.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/text_widget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

import 'widgets/custom_button_widget.dart';

class OnBoardSplashScreen1 extends StatefulWidget {
  const OnBoardSplashScreen1({super.key});

  @override
  State<OnBoardSplashScreen1> createState() => _OnBoardSplashScreen1State();
}

class _OnBoardSplashScreen1State extends State<OnBoardSplashScreen1> {
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
            image: ImageConstant.onBoard1,
            height: 183.29,
            width: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          TextWidget(
              alignment: Alignment.centerLeft,
              text: "You Can Sell Your Property\nAnd Buy A New Property",
              fontWeight: FontWeight.bold,
              fontSize: 23,
              textColor: AppColors.titleTextColor),
          const TextWidget(
              alignment: Alignment.centerLeft,
              text:
                  "sell your property, acquire a new one, and\nseamlessly transition to the next phase of your\njourney with confidence and ease.",
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
                                  const OnBoardSplashScreen2(),
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
