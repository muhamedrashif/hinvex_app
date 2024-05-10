import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';

class LocationInputWidget extends StatelessWidget {
  LocationInputWidget({super.key});
  final TextEditingController _locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Location*",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: CustomTextFormFieldWidget(
            hintText: "Enter The Selling Location",
            controller: _locationController,
            suffixIcon: Transform.scale(
              scale: .75,
              child: Image.asset(
                ImageConstant.locationIcon,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
