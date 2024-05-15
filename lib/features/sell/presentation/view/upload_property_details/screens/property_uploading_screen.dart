import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/provider/sell_provider.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/screens/price_screen.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/breadth_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/carParking_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/carpetArea_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/floorNo_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/length_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/listedBy_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/location_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/plotArea_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/pricePersqft_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/project_name_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/totalFloors_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/type_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/washroom_widget.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_button_widget.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/utils/enums/enums.dart';
import 'package:hinvex_app/general/utils/progress_indicator_widget/progress_indicator_widget.dart';
import 'package:hinvex_app/general/utils/toast/toast.dart';
import 'package:provider/provider.dart';
import '../widgets/addTitle_widget.dart';
import '../widgets/bathroom_widget.dart';
import '../widgets/bedroom_widget.dart';
import '../widgets/bhk_widget.dart';
import '../widgets/construction_Status_widget.dart';
import '../widgets/description_widget.dart';
import '../widgets/furnishing_widget.dart';
import '../widgets/superBuilupArea_widget.dart';

class PropertyUploadingScreen extends StatefulWidget {
  final String categoryName;
  final SelectedCategory selectedCategory;
  const PropertyUploadingScreen({
    super.key,
    required this.categoryName,
    required this.selectedCategory,
  });

  @override
  State<PropertyUploadingScreen> createState() =>
      _PropertyUploadingScreenState();
}

class _PropertyUploadingScreenState extends State<PropertyUploadingScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    log("${widget.categoryName}+${widget.selectedCategory}");
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        iconTheme: IconThemeData(color: AppColors.titleTextColor),
        title: Text(
          "Upload Your Property",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.titleTextColor),
        ),
      ),
      body: Consumer<SellProvider>(builder: (context, state, _) {
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
                      LocationInputWidget(
                        formKey: formKey,
                      ),
                      TypeInputWidget(
                        formKey: formKey,
                      ),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments')
                        const BedRoomInputWidget(),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments')
                        const BathRoomInputWidget(),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments' ||
                          widget.categoryName == 'Commercial' ||
                          widget.categoryName == 'Co-Working Space' ||
                          widget.categoryName == 'PG & Guest House')
                        const FurnishingInputWidget(),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments' ||
                          widget.categoryName == 'Co-Working Space' ||
                          widget.categoryName == 'Commercial')
                        const ConstructionStatusInputWidget(),
                      ListedByInputWidget(
                        formKey: formKey,
                      ),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments' ||
                          widget.categoryName == 'Co-Working Space' ||
                          widget.categoryName == 'Commercial')
                        SuperBuilupAreaInputWidget(),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments')
                        PricePersqftInputWidget(),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments' ||
                          widget.categoryName == 'Co-Working Space' ||
                          widget.categoryName == 'Commercial')
                        CarpetAreaInputWidget(),
                      if (widget.categoryName == 'Commercial' ||
                          widget.categoryName == 'Co-Working Space')
                        WashRoomInputWidget(),
                      if (widget.categoryName == 'Lands/Plots')
                        PlotAreaInputWidget(),
                      if (widget.categoryName == 'Lands/Plots')
                        LengthInputWidget(),
                      if (widget.categoryName == 'Lands/Plots')
                        BreadthInputWidget(),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments')
                        TotalFloorsInputWidget(),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments')
                        FloorNoInputWidget(),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments' ||
                          widget.categoryName == 'Commercial' ||
                          widget.categoryName == 'Co-Working Space' ||
                          widget.categoryName == 'PG & Guest House')
                        const CarParkingInputWidget(),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments')
                        const BHKInputWidget(),
                      if (widget.categoryName == 'House' ||
                          widget.categoryName == 'Apartments' ||
                          widget.categoryName == 'Commercial' ||
                          widget.categoryName == 'Co-Working Space' ||
                          widget.categoryName == 'Lands/Plots')
                        const ProjectNameInputWidget(),
                      AddTitleInputWidget(
                        formKey: formKey,
                      ),
                      DescribeInputWidget(
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
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();

                              if (state.imageFile.length > 7) {
                                showToast(
                                  "Maximum Allowed Images 7",
                                );
                                return;
                              }

                              showProgress(context);

                              state.getImage(onSuccess: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PriceScreen(),
                                    ));
                              }, onFailure: () {
                                showToast(
                                  "Maximum Allowed Images 7",
                                );
                                Navigator.pop(context);
                              });
                            }
                          },
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
