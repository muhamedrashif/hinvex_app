import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/presentation/view/authentocation_screen.dart';
import 'package:hinvex_app/features/onboard/data/local_data/onboard_local_data.dart';
import 'package:hinvex_app/features/onboard/presentation/view/widgets/onbording_frame.dart';
import 'package:hinvex_app/general/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/widgets/custom_outLines_button_widget.dart';
import 'package:hinvex_app/general/utils/image_constants.dart';
import 'package:hinvex_app/general/utils/colors.dart';
import '../../../../general/widgets/custom_button_widget.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
          SizedBox(
            height: 400,
            child: PageView.builder(
              controller: pageController,
              itemCount: OnboardLocalData.list.length,
              itemBuilder: (context, index) {
                return OnBoardFrame(
                  onboardModel: OnboardLocalData.list[index],
                );
              },
            ),
          ),
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
                        if (OnboardLocalData.list.length ==
                            (pageController.page!.toInt() + 1)) {
                          OnboardLocalData.onBoardLocalStore();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AuthenticationScreen(),
                              ));
                        } else {
                          final newPageindex = pageController.page!.toInt() + 1;
                          pageController.animateToPage(
                            newPageindex,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomOutLineButtonWidget(
                      height: 48,
                      width: 52,
                      text: "Skip",
                      textColor: Colors.grey,
                      onTap: () {
                        OnboardLocalData.onBoardLocalStore();
                        Navigator.pushReplacement(
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
