import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';

class DescribeInputWidget extends StatelessWidget {
  DescribeInputWidget({super.key});
  final TextEditingController _describeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Describe*",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: CustomTextFormFieldWidget(
            hintText: "Describe About What you are selling",
            controller: _describeController,
            maxLength: 4096,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 8.0,
            bottom: 8,
          ),
          child: Text(
            "Encompassing condition, attributes, and rationale for sale",
            style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
        )
      ],
    );
  }
}
