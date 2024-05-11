import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/provider/sell_provider.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';
import 'package:provider/provider.dart';

class AddTitleInputWidget extends StatelessWidget {
  const AddTitleInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellProvider>(builder: (context, state, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Add Title*",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CustomTextFormFieldWidget(
              hintText: "Give A Title",
              controller: state.addTitleController,
              maxLength: 70,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 8.0,
              bottom: 8,
            ),
            child: Text(
              "Highlight the standout feature of your Property (eg, Brand,\nModel, Age and type, etc)",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
          )
        ],
      );
    });
  }
}
