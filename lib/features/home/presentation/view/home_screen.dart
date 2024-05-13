import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hinvex_app/features/notification/presentation/view/notification_screen.dart';
import 'package:hinvex_app/features/profile/presentation/view/profile_screen.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/utils/showExitPopup_widget/showExitPopup_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () => showExitPopup(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustumImage(
                            image: ImageConstant.hinvexAppLogo,
                            height: 15.87,
                            width: 72.66,
                            alignment: Alignment.topLeft,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Kunnamangalam",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: AppColors.titleTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        child: CustumImage(
                          image: ImageConstant.bellIcon,
                          height: 27.87,
                          width: 27.87,
                          alignment: Alignment.topLeft,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotificationScreen(),
                              ));
                        },
                      ),
                      GestureDetector(
                        child: CustumImage(
                          image: ImageConstant.profileIcon,
                          height: 27.87,
                          width: 27.87,
                          alignment: Alignment.topLeft,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(),
                              ));
                        },
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
