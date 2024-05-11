import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hinvex_app/features/bottomNavigationBar/presentation/view/bottom_navigation_widget.dart';
import 'package:hinvex_app/features/sell/presentation/provider/sell_provider.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_button_widget.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        iconTheme: IconThemeData(color: AppColors.titleTextColor),
        title: Text(
          "Upload Your Property Images",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.titleTextColor,
          ),
        ),
      ),
      body: Consumer<SellProvider>(builder: (context, state, _) {
        return Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: AppColors.primaryColor,
                                  radius: 28,
                                ),
                              ),
                            ),
                            const Text(
                              "Your Name*",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                  color: Colors.grey),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: CustomTextFormFieldWidget(
                                hintText: "HinveX",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                readOnly: true,
                              ),
                            ),
                            const Text(
                              "Contact Number*",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                  color: Colors.grey),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: CustomTextFormFieldWidget(
                                hintText: "7356723212",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                readOnly: true,
                              ),
                            ),
                            const Text(
                              "WhatsApp Number*",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                  color: Colors.grey),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: CustomTextFormFieldWidget(
                                hintText: "7356723212",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                readOnly: true,
                              ),
                            ),
                            const Text(
                              "Location*",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                  color: Colors.grey),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: CustomTextFormFieldWidget(
                                hintText: "Nilambur",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                suffixIcon: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 18,
                                  color: Colors.black,
                                ),
                                readOnly: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: CustomButtonWidget(
                height: 44,
                width: MediaQuery.of(context).size.width,
                buttonColor: AppColors.textButtonColor,
                text: "Upload Now",
                textColor: AppColors.buttonTextColor,
                onTap: () {
                  log("state.1.${state.addTitleController.text}");
                  log("state.2.${state.bHKController.text}");
                  log("state.3.${state.bathRoomController.text}");
                  log("state.4.${state.bedRoomController.text}");
                  log("state.5.${state.breadthController.text}");
                  log("state.6.${state.carParkingController.text}");
                  log("state.7.${state.carpetAreaController.text}");
                  log("state.8.${state.constructionStatusController.text}");
                  log("state.9.${state.describeController.text}");
                  log("state.10.${state.floorNoController.text}");
                  log("state.11.${state.furnishingController.text}");
                  log("state.12.${state.lengthController.text}");
                  log("state.13.${state.listedByController.text}");
                  log("state.14.${state.placeCellUploadLocation}");
                  log("state.15.${state.plotAreaController.text}");
                  log("state.16.${state.pricePersqftController.text}");
                  log("state.17.${state.projectNameController.text}");
                  log("state.18.${state.superBuilupAreaController.text}");
                  log("state.19.${state.totalFloorsController.text}");
                  log("state.20.${state.typeController.text}");
                  log("state.21.${state.washRoomController.text}");
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavigationWidget(),
                      ),
                      (route) => false);
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
