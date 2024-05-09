import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading/price_screen.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading/property_uploading_widgets/breadth_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading/property_uploading_widgets/carParking_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading/property_uploading_widgets/carpetArea_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading/property_uploading_widgets/floorNo_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading/property_uploading_widgets/length_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading/property_uploading_widgets/listedBy_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading/property_uploading_widgets/location_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading/property_uploading_widgets/plotArea_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading/property_uploading_widgets/pricePersqft_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading/property_uploading_widgets/project_name_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading/property_uploading_widgets/totalFloors_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading/property_uploading_widgets/type_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading/property_uploading_widgets/washroom_widget.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_button_widget.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'property_uploading_widgets/addTitle_widget.dart';
import 'property_uploading_widgets/bathroom_widget.dart';
import 'property_uploading_widgets/bedroom_widget.dart';
import 'property_uploading_widgets/bhk_widget.dart';
import 'property_uploading_widgets/construction_Status_widget.dart';
import 'property_uploading_widgets/description_widget.dart';
import 'property_uploading_widgets/furnishing_widget.dart';
import 'property_uploading_widgets/superBuilupArea_widget.dart';

class PropertyUploadingScreen extends StatefulWidget {
  const PropertyUploadingScreen({super.key});

  @override
  State<PropertyUploadingScreen> createState() =>
      _PropertyUploadingScreenState();
}

class _PropertyUploadingScreenState extends State<PropertyUploadingScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
                child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LocationInputWidget(),
                  TypeInputWidget(),
                  BedRoomInputWidget(),
                  BathRoomInputWidget(),
                  FurnishingInputWidget(),
                  ConstructionStatusInputWidget(),
                  ListedByInputWidget(),
                  SuperBuilupAreaInputWidget(),
                  PricePersqftInputWidget(),
                  CarpetAreaInputWidget(),
                  WashRoomInputWidget(),
                  PlotAreaInputWidget(),
                  LengthInputWidget(),
                  BreadthInputWidget(),
                  TotalFloorsInputWidget(),
                  FloorNoInputWidget(),
                  CarParkingInputWidget(),
                  BHKInputWidget(),
                  ProjectNameInputWidget(),
                  AddTitleInputWidget(),
                  DescribeInputWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomButtonWidget(
                      height: 44,
                      width: MediaQuery.of(context).size.width,
                      buttonColor: AppColors.textButtonColor,
                      text: "Next",
                      textColor: AppColors.buttonTextColor,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PriceScreen(),
                            ));
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
  }
}
