import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/presentation/provider/auth_provider.dart';
import 'package:hinvex_app/features/bottomNavigationBar/presentation/view/bottom_navigation_widget.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/features/sell/presentation/provider/sell_provider.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_button_widget.dart';
import 'package:hinvex_app/general/utils/Customwidgets/CustomNetworkImageWidget.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/utils/progress_indicator_widget/progress_indicator_widget.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';
import 'package:hinvex_app/general/utils/toast/toast.dart';
import 'package:provider/provider.dart';

class PriceScreen extends StatefulWidget {
  final PropertyModel? propertyModel;
  const PriceScreen({super.key, this.propertyModel});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        iconTheme: IconThemeData(color: AppColors.titleTextColor),
        title: Text(
          "Set A Price",
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
        return Form(
          key: _formKey,
          child: Column(
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
                              state.imageFile.isNotEmpty
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (state.imageFile.length > 7) {
                                              showToast(
                                                "Maximum Allowed Images 7",
                                              );
                                              return;
                                            }

                                            showProgress(context);

                                            state.getImage(onSuccess: () {
                                              Navigator.pop(context);
                                            }, onFailure: () {
                                              showToast(
                                                "Maximum Allowed Images 7",
                                              );
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: const SizedBox(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.image,
                                                  size: 16,
                                                  color: Colors.grey,
                                                ),
                                                Text(
                                                  "Edit",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                              state.imageFile.isEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Pick your image from here",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (state.imageFile.length > 7) {
                                                showToast(
                                                  "Maximum Allowed Images 7",
                                                );
                                                return;
                                              }

                                              showProgress(context);

                                              state.getImage(onSuccess: () {
                                                Navigator.pop(context);
                                              }, onFailure: () {
                                                showToast(
                                                  "Maximum Allowed Images 7",
                                                );
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: const SizedBox(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.image,
                                                      size: 16,
                                                      color: Colors.grey,
                                                    ),
                                                    Text(
                                                      "Image",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: SizedBox(
                                        height: 200,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        // decoration: BoxDecoration(
                                        //   color: AppColors.backgroundColor,
                                        //   borderRadius: BorderRadius.circular(6),
                                        //   boxShadow: [
                                        //     BoxShadow(
                                        //       color: Colors.black.withOpacity(0.2),
                                        //       blurRadius: 3,
                                        //       spreadRadius: 0,
                                        //       offset: const Offset(0, 0),
                                        //     ),
                                        //   ],
                                        // ),
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: state.imageFile.length,
                                          itemBuilder: (context, index) {
                                            return Center(
                                              child: Stack(
                                                children: [
                                                  CustomNetworkImageWidget(
                                                    imageUrl: state
                                                        .imageFile[index]
                                                        .toString(),
                                                    width: 300,
                                                    height: 200,
                                                  ),
                                                  Positioned(
                                                      top: 10,
                                                      right: 10,
                                                      child: InkWell(
                                                        onTap: () {
                                                          state
                                                              .removeImageAtIndex(
                                                                  index);
                                                        },
                                                        child: const Icon(
                                                          Icons.cancel,
                                                          size: 20,
                                                        ),
                                                      )),
                                                  Positioned(
                                                    bottom: 10,
                                                    left: 10,
                                                    child: Text(
                                                      "${index + 1}/${state.imageFile.length}",
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                              const Text(
                                "Define Your Price*",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: CustomTextFormFieldWidget(
                                  hintText: "Enter Here",
                                  controller: state.priceController,
                                  keyboardType: TextInputType.number,
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Please Enter Here';
                                    }
                                    return null;
                                  },
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
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        // if (widget.propertyModel != null) {
                        //   // if (state.imageFile.isNotEmpty) {
                        //   int? selectedBedroom;

                        //   if (state.bedRoomController.text.isNotEmpty) {
                        //     if (state.bedRoomController.text == '+4') {
                        //       selectedBedroom = 5;
                        //     } else {
                        //       selectedBedroom =
                        //           int.tryParse(state.bedRoomController.text);
                        //     }
                        //   }

                        //   int? selectedBathroom;

                        //   if (state.bathRoomController.text.isNotEmpty) {
                        //     if (state.bathRoomController.text == '+4') {
                        //       selectedBathroom = 5;
                        //     } else {
                        //       selectedBathroom =
                        //           int.tryParse(state.bathRoomController.text);
                        //     }
                        //   }

                        //   int? selectedCarParking;

                        //   if (state.carParkingController.text.isNotEmpty) {
                        //     if (state.carParkingController.text == '+4') {
                        //       selectedCarParking = 5;
                        //     } else {
                        //       selectedCarParking =
                        //           int.tryParse(state.carParkingController.text);
                        //     }
                        //   }

                        //   showProgress(context);
                        //   state.updateUploadedPosts(
                        //       propertyModel: PropertyModel(
                        //         phoneNumber: authProviderState!.userPhoneNumber,
                        //         whatsAppNumber:
                        //             authProviderState.userWhatsAppNumber,

                        //         userId: authProviderState.userId,

                        //         /////////////////////
                        //         createDate: Timestamp.now(),
                        //         updateDate: Timestamp.now(),
                        //         bathRooms: selectedBathroom,
                        //         bedRooms: selectedBedroom,
                        //         bhk: state.selectedBHKValue,
                        //         carParking: selectedCarParking,
                        //         carpetAreaft: int.tryParse(
                        //             state.carpetAreaController.text),
                        //         constructionStatus:
                        //             PropertyModel.getConstructionStatus(state
                        //                 .constructionStatusController.text),

                        //         floorNo:
                        //             int.tryParse(state.floorNoController.text),
                        //         furnishing: PropertyModel.getSelectedFurnisher(
                        //             state.furnishingController.text),
                        //         listedBy: PropertyModel.getSelectedListedBy(
                        //             state.listedByController.text),
                        //         noOfReports: 0,
                        //         plotArea:
                        //             int.tryParse(state.plotAreaController.text),
                        //         plotBreadth:
                        //             int.tryParse(state.breadthController.text),
                        //         plotLength:
                        //             int.tryParse(state.lengthController.text),
                        //         pricePerstft: int.tryParse(
                        //             state.pricePersqftController.text),
                        //         projectName: state.projectNameController.text,
                        //         propertyCategory: state.selectedCategory,
                        //         propertyLocation: state.placeCellUploadLocation,
                        //         propertyPrice:
                        //             int.tryParse(state.priceController.text),
                        //         propertyTitle: state.addTitleController.text,
                        //         propertyType: PropertyModel.getSelectedType(
                        //             state.typeController.text),
                        //         propertyDetils: state.describeController.text,
                        //         description: state.descriptionController.text,
                        //         superBuiltupAreaft: int.tryParse(
                        //             state.superBuilupAreaController.text),
                        //         totalFloors: int.tryParse(
                        //             state.totalFloorsController.text),
                        //         washRoom:
                        //             int.tryParse(state.washRoomController.text),
                        //         propertyImage:
                        //             widget.propertyModel!.propertyImage,
                        //       ),
                        //       onSuccess: () {
                        //         state
                        //           ..clearData()
                        //           ..imageFile.clear();
                        //         showToast("Edit Property Success");
                        //         Navigator.pushAndRemoveUntil(
                        //             context,
                        //             MaterialPageRoute(
                        //               builder: (context) =>
                        //                   const BottomNavigationWidget(),
                        //             ),
                        //             (route) => false);
                        //       },
                        //       onFailure: () {
                        //         showToast("Edit Property Failed");
                        //         Navigator.pop(context);
                        //       });
                        //   // } else {
                        //   //   showToast("Please Select Image");
                        //   // }
                        // } else {

                        if (state.imageFile.isNotEmpty) {
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
                                id: widget.propertyModel!.id,
                                phoneNumber: authProviderState!.userPhoneNumber,
                                whatsAppNumber:
                                    authProviderState.userWhatsAppNumber,

                                userId: authProviderState.userId,

                                /////////////////////
                                createDate: Timestamp.now(),
                                updateDate: Timestamp.now(),
                                bathRooms: selectedBathroom,
                                bedRooms: selectedBedroom,
                                bhk: state.selectedBHKValue,
                                carParking: selectedCarParking,
                                carpetAreaft: int.tryParse(
                                    state.carpetAreaController.text),
                                constructionStatus:
                                    PropertyModel.getConstructionStatus(state
                                        .constructionStatusController.text),

                                floorNo:
                                    int.tryParse(state.floorNoController.text),
                                furnishing: PropertyModel.getSelectedFurnisher(
                                    state.furnishingController.text),
                                listedBy: PropertyModel.getSelectedListedBy(
                                    state.listedByController.text),
                                noOfReports: 0,
                                plotArea:
                                    int.tryParse(state.plotAreaController.text),
                                plotBreadth:
                                    int.tryParse(state.breadthController.text),
                                plotLength:
                                    int.tryParse(state.lengthController.text),
                                pricePerstft: int.tryParse(
                                    state.pricePersqftController.text),
                                projectName: state.projectNameController.text,
                                propertyCategory: state.selectedCategory,
                                propertyLocation: state.placeCellUploadLocation,
                                propertyPrice:
                                    int.tryParse(state.priceController.text),
                                propertyTitle: state.addTitleController.text,
                                propertyType: PropertyModel.getSelectedType(
                                    state.typeController.text),
                                propertyDetils: state.describeController.text,
                                description: state.descriptionController.text,
                                superBuiltupAreaft: int.tryParse(
                                    state.superBuilupAreaController.text),
                                totalFloors: int.tryParse(
                                    state.totalFloorsController.text),
                                washRoom:
                                    int.tryParse(state.washRoomController.text),
                                propertyImage: state.imageFile,
                              ),
                              onSuccess: () {
                                state
                                  ..clearData()
                                  ..imageFile.clear();
                                showToast("Upload Property Success");
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const BottomNavigationWidget(),
                                    ),
                                    (route) => false);
                              },
                              onFailure: () {
                                showToast("Upload Property Failed");
                                Navigator.pop(context);
                              });
                        } else {
                          showToast("Please Select Image");
                        }
                      }
                      // }
                    }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
