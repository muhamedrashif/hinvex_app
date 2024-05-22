import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hinvex_app/features/edit_Uploaded_Property/presentation/provider/edit_proprty_provider.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_button_widget.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:provider/provider.dart';

import 'widget/addTitle_widget.dart';
import 'widget/bathroom_widget.dart';
import 'widget/bedroom_widget.dart';
import 'widget/bhk_widget.dart';
import 'widget/breadth_widget.dart';
import 'widget/carParking_widget.dart';
import 'widget/carpetArea_widget.dart';
import 'widget/construction_Status_widget.dart';
import 'widget/describe_widget.dart';
import 'widget/description_widget.dart';
import 'widget/floorNo_widget.dart';
import 'widget/furnishing_widget.dart';
import 'widget/length_widget.dart';
import 'widget/listedBy_widget.dart';
import 'widget/location_widget.dart';
import 'widget/plotArea_widget.dart';
import 'widget/pricePersqft_widget.dart';
import 'widget/project_name_widget.dart';
import 'widget/superBuilupArea_widget.dart';
import 'widget/totalFloors_widget.dart';
import 'widget/type_widget.dart';
import 'widget/washroom_widget.dart';

class EditPropertyScreen extends StatefulWidget {
  final String? categoryName;
  final String? selectedCategory;
  final PropertyModel? propertyModel;

  const EditPropertyScreen({
    super.key,
    this.categoryName,
    this.selectedCategory,
    this.propertyModel,
  });

  @override
  State<EditPropertyScreen> createState() => _EditPropertyScreenState();
}

class _EditPropertyScreenState extends State<EditPropertyScreen> {
  final formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     if (widget.propertyModel != null) {
  //       Provider.of<SellProvider>(context, listen: false)
  //           .editPost(editProperty: widget.propertyModel);
  //     }
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    log("${widget.categoryName}+${widget.selectedCategory}");
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        iconTheme: IconThemeData(color: AppColors.titleTextColor),
        title: Text(
          "Edit Your Property",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.titleTextColor),
        ),
      ),
      body: Consumer<EditPropertProvider>(builder: (context, state, _) {
        return Form(
          key: formKey,
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
                      LocationInputEditWidget(
                        formKey: formKey,
                      ),
                      TypeInputEditWidget(
                        formKey: formKey,
                      ),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments')
                        BedRoomInputEditWidget(
                          formKey: formKey,
                        ),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments')
                        BathRoomInputEditWidget(
                          formKey: formKey,
                        ),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments' ||
                          widget.categoryName == 'Commercial' ||
                          widget.categoryName == 'Co-Working Space' ||
                          widget.categoryName == 'PG & Guest House')
                        FurnishingInputEditWidget(
                          formKey: formKey,
                        ),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments' ||
                          widget.categoryName == 'Co-Working Space' ||
                          widget.categoryName == 'Commercial')
                        ConstructionStatusInputEditWidget(
                          formKey: formKey,
                        ),
                      ListedByInputEditWidget(
                        formKey: formKey,
                      ),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments' ||
                          widget.categoryName == 'Co-Working Space' ||
                          widget.categoryName == 'Commercial')
                        SuperBuilupAreaInputEditWidget(
                          formKey: formKey,
                        ),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments')
                        PricePersqftInputEditWidget(
                          formKey: formKey,
                        ),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments' ||
                          widget.categoryName == 'Co-Working Space' ||
                          widget.categoryName == 'Commercial')
                        CarpetAreaInputEditWidget(
                          formKey: formKey,
                        ),
                      if (widget.categoryName == 'Commercial' ||
                          widget.categoryName == 'Co-Working Space')
                        WashRoomInputEditWidget(
                          formKey: formKey,
                        ),
                      if (widget.categoryName == 'Lands/Plots')
                        PlotAreaInputEditWidget(
                          formKey: formKey,
                        ),
                      if (widget.categoryName == 'Lands/Plots')
                        LengthInputEditWidget(
                          formKey: formKey,
                        ),
                      if (widget.categoryName == 'Lands/Plots')
                        BreadthInputEditWidget(
                          formKey: formKey,
                        ),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments')
                        TotalFloorsInputEditWidget(
                          formKey: formKey,
                        ),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments')
                        FloorNoInputEditWidget(
                          formKey: formKey,
                        ),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments' ||
                          widget.categoryName == 'Commercial' ||
                          widget.categoryName == 'Co-Working Space' ||
                          widget.categoryName == 'PG & Guest House')
                        CarParkingInputEditWidget(
                          formKey: formKey,
                        ),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments')
                        BHKInputEditWidget(
                          formKey: formKey,
                        ),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments' ||
                          widget.categoryName == 'Commercial' ||
                          widget.categoryName == 'Co-Working Space' ||
                          widget.categoryName == 'Lands/Plots')
                        ProjectNameInputEditWidget(
                          formKey: formKey,
                        ),
                      AddTitleInputEditWidget(
                        formKey: formKey,
                      ),
                      DescribeInputEditWidget(
                        formKey: formKey,
                      ),
                      DescriptionInputEditWidget(
                        formKey: formKey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomButtonWidget(
                            height: 44,
                            width: MediaQuery.of(context).size.width,
                            buttonColor: AppColors.textButtonColor,
                            text: "Next",
                            textColor: AppColors.buttonTextColor,
                            onTap: () {
                              // if (formKey.currentState!.validate()) {
                              //   formKey.currentState!.save();
                              //   // if (widget.propertyModel != null) {
                              //   //   Navigator.push(
                              //   //       context,
                              //   //       MaterialPageRoute(
                              //   //         builder: (context) => PriceScreen(
                              //   //           propertyModel: widget.propertyModel,
                              //   //         ),
                              //   //       ));
                              //   // } else {
                              //   if (state.imageFile.length > 7) {
                              //     showToast(
                              //       "Maximum Allowed Images 7",
                              //     );

                              //     return;
                              //   }

                              //   showProgress(context);

                              //   state.getImage(onSuccess: () {
                              //     Navigator.pop(context);
                              //     // Navigator.push(
                              //     //     context,
                              //     //     MaterialPageRoute(
                              //     //       builder: (context) =>
                              //     //           const PriceScreen(),
                              //     //     ));
                              //   }, onFailure: () {
                              //     showToast(
                              //       "Maximum Allowed Images 7",
                              //     );
                              //     Navigator.pop(context);
                              //     // Navigator.push(
                              //     //     context,
                              //     //     MaterialPageRoute(
                              //     //       builder: (context) =>
                              //     //           const PriceScreen(),
                              //     //     ));
                              //   });
                              // }
                            }
                            // },
                            ),
                      ),
                    ],
                  ),
                )),
              ),
            ],
          ),
        );
      }),
    );
  }
}
