import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/provider/sell_provider.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';
import 'package:provider/provider.dart';

class TotalFloorsInputWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const TotalFloorsInputWidget({super.key, required this.formKey});
  @override
  Widget build(BuildContext context) {
    return Consumer<SellProvider>(builder: (context, state, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Total Floors*",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CustomTextFormFieldWidget(
              hintText: "Enter Here",
              controller: state.totalFloorsController,
              keyboardType: TextInputType.number,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Please Enter Total Floors';
                }
                return null;
              },
            ),
          ),
        ],
      );
    });
  }
}
