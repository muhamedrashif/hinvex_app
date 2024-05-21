import 'package:flutter/material.dart';
import 'package:hinvex_app/features/edit_Uploaded_Property/presentation/provider/edit_proprty_provider.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';
import 'package:provider/provider.dart';

class WashRoomInputEditWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const WashRoomInputEditWidget({super.key, required this.formKey});
  @override
  Widget build(BuildContext context) {
    return Consumer<EditPropertProvider>(builder: (context, state, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Wash Room*",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CustomTextFormFieldWidget(
              hintText: "Enter Here",
              controller: state.washRoomController,
              keyboardType: TextInputType.number,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Please Enter Wash Room';
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
