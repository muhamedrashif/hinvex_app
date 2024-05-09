import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';

class BreadthInputWidget extends StatelessWidget {
  BreadthInputWidget({super.key});
  final TextEditingController _breadthController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Breadth*",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: CustomTextFormFieldWidget(
            hintText: "Enter Here",
            controller: _breadthController,
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
