import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading_widgets/location_widget.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading_widgets/type_widget.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';

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
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocationInputWidget(),
              TypeInputWidget(),
            ],
          ),
        ),
      )),
    );
  }
}
