import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/presentation/provider/auth_provider.dart';
import 'package:hinvex_app/features/bottomNavigationBar/presentation/view/bottom_navigation_widget.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/features/sell/presentation/provider/sell_provider.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_button_widget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/utils/progress_indicator_widget/progress_indicator_widget.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';
import 'package:hinvex_app/general/utils/toast/toast.dart';
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
          "Review Your Details",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.titleTextColor,
          ),
        ),
      ),
      body: Consumer<SellProvider>(builder: (context, state, _) {
        final authProviderState =
            Provider.of<AuthProvider>(context, listen: false).userModel;
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
                                  backgroundImage:
                                      AssetImage(ImageConstant.defaultProfile),
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: CustomTextFormFieldWidget(
                                hintText:
                                    authProviderState!.userName ?? "HinveX",
                                hintStyle: const TextStyle(
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: CustomTextFormFieldWidget(
                                hintText: authProviderState.userPhoneNumber,
                                hintStyle: const TextStyle(
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: CustomTextFormFieldWidget(
                                hintText:
                                    authProviderState.userWhatsAppNumber ??
                                        "Please Enter WhatsApp Number",
                                hintStyle: const TextStyle(
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: CustomTextFormFieldWidget(
                                hintText:
                                    authProviderState.userLocation!.localArea ??
                                        'Please Enter Your Location',
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                suffixIcon: const Icon(
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
                  // log("${PropertyModel.getSelectedFurnisher(state.furnishingController.text.toString())}");
                  int? selectedBedroom;

                  if (state.bedRoomController.text.isNotEmpty) {
                    if (state.bedRoomController.text == '+4') {
                      selectedBedroom = 5;
                    } else {
                      selectedBedroom =
                          int.tryParse(state.bedRoomController.text);
                    }
                  }

                  int? selectedBathroom;

                  if (state.bathRoomController.text.isNotEmpty) {
                    if (state.bathRoomController.text == '+4') {
                      selectedBathroom = 5;
                    } else {
                      selectedBathroom =
                          int.tryParse(state.bathRoomController.text);
                    }
                  }

                  int? selectedCarParking;

                  if (state.carParkingController.text.isNotEmpty) {
                    if (state.carParkingController.text == '+4') {
                      selectedCarParking = 5;
                    } else {
                      selectedCarParking =
                          int.tryParse(state.carParkingController.text);
                    }
                  }

                  showProgress(context);
                  state.uploadPropertyToFireStore(
                      propertyModel: PropertyModel(
                        createDate: Timestamp.now(),
                        updateDate: Timestamp.now(),
                        bathRooms: selectedBathroom,
                        bedRooms: selectedBedroom,
                        bhk: state.selectedBHKValue,
                        carParking: selectedCarParking,
                        carpetAreaft:
                            int.tryParse(state.carpetAreaController.text),
                        constructionStatus: PropertyModel.getConstructionStatus(
                            state.constructionStatusController.text),
                        description: state.describeController.text,
                        floorNo: int.tryParse(state.floorNoController.text),
                        furnishing: PropertyModel.getSelectedFurnisher(
                            state.furnishingController.text),
                        listedBy: PropertyModel.getSelectedListedBy(
                            state.listedByController.text),
                        noOfReports: 0,
                        plotArea: int.tryParse(state.plotAreaController.text),
                        plotBreadth: int.tryParse(state.breadthController.text),
                        plotLength: int.tryParse(state.lengthController.text),
                        pricePerstft:
                            int.tryParse(state.pricePersqftController.text),
                        projectName: state.projectNameController.text,
                        propertyCategory: state.selectedCategory,
                        propertyLocation: state.placeCellUploadLocation,
                        propertyPrice: int.tryParse(state.priceController.text),
                        propertyTitle: state.addTitleController.text,
                        propertyType: PropertyModel.getSelectedType(
                            state.typeController.text),
                        superBuiltupAreaft:
                            int.tryParse(state.superBuilupAreaController.text),
                        totalFloors:
                            int.tryParse(state.totalFloorsController.text),
                        washRoom: int.tryParse(state.washRoomController.text),
                        phoneNumber: "+91 7356723212",
                        whatsAppNumber: "+91 7356723212",
                      ),
                      onSuccess: () {
                        state.addTitleController.clear();
                        state.bHKController.clear();
                        state.bathRoomController.clear();
                        state.bedRoomController.clear();
                        state.breadthController.clear();
                        state.carParkingController.clear();
                        state.constructionStatusController.clear();
                        state.carpetAreaController.clear();
                        state.describeController.clear();
                        state.floorNoController.clear();
                        state.furnishingController.clear();
                        state.lengthController.clear();
                        state.listedByController.clear();
                        state.locationController.clear();
                        state.placeCellUploadLocation = null;
                        state.plotAreaController.clear();
                        state.priceController.clear();
                        state.pricePersqftController.clear();
                        state.projectNameController.clear();
                        state.selectedBHKValue = 0;
                        state.selectedCategory = null;
                        state.superBuilupAreaController.clear();
                        state.totalFloorsController.clear();
                        state.typeController.clear();
                        state.washRoomController.clear();
                        showToast("Success");

                        Navigator.pop(context);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigationWidget(),
                            ),
                            (route) => false);
                      },
                      onFailure: () {
                        showToast("Failed");
                        Navigator.pop(context);
                      });
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
