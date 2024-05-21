import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';
import 'package:provider/provider.dart';

import '../../provider/edit_proprty_provider.dart';

class ProjectNameInputEditWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const ProjectNameInputEditWidget({super.key, required this.formKey});
  @override
  Widget build(BuildContext context) {
    return Consumer<EditPropertProvider>(builder: (context, state, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Project Name*",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CustomTextFormFieldWidget(
              hintText: "Enter Your Project Name",
              controller: state.projectNameController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Please Enter Your Project Name';
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
