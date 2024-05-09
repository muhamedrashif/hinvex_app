import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';

class SuperBuilupAreaInputWidget extends StatelessWidget {
  SuperBuilupAreaInputWidget({super.key});
  final TextEditingController _superBuilupAreaController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Super Builup Area(ft2)*",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: CustomTextFormFieldWidget(
            hintText: "Enter Here",
            controller: _superBuilupAreaController,
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
