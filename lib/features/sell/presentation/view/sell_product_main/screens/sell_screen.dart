import 'package:flutter/material.dart';
import 'package:hinvex_app/features/bottomNavigationBar/presentation/view/bottom_navigation_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/sell_product_main/widgets/sell_container_widget.dart';
import 'package:hinvex_app/general/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/image_constants.dart';
import 'package:hinvex_app/general/utils/colors.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const BottomNavigationScreen();
            },
          ));
          return Future.value(true);
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
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
                      "Sell Your Product",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.titleTextColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "What type of property do you offer?",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.subtitleTextColor,
                      ),
                    ),
                  ),
                  const SellContainerWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
