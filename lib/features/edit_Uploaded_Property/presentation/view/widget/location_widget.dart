import 'package:flutter/material.dart';
import 'package:hinvex_app/features/edit_Uploaded_Property/presentation/view/widget/aa_location_search_widget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';
import 'package:provider/provider.dart';

import '../../provider/edit_proprty_provider.dart';

class LocationInputEditWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LocationInputEditWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Consumer<EditPropertProvider>(builder: (context, state, _) {
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
              controller: state.locationController,
              suffixIcon: Transform.scale(
                scale: .75,
                child: Image.asset(
                  ImageConstant.locationIcon,
                  fit: BoxFit.cover,
                ),
              ),
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Please Enter The Selling Location';
                }
                return null;
              },
              readOnly: true,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LocationSearchEditWidget(),
                    ));
              },
            ),
          ),
        ],
      );
    });
  }
}
