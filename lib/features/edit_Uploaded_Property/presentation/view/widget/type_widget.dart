import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/aa_popup_selection_widget.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';
import 'package:provider/provider.dart';

import '../../provider/edit_proprty_provider.dart';

class TypeInputEditWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const TypeInputEditWidget({super.key, required this.formKey});

  @override
  State<TypeInputEditWidget> createState() => _TypeInputEditWidgetState();
}

class _TypeInputEditWidgetState extends State<TypeInputEditWidget> {
  // TYPE
  String? _selectedType;

  final List<String> _type = [
    'Sell',
    'Rent',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<EditPropertProvider>(builder: (context, state, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Type*",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CustomTextFormFieldWidget(
              hintText: "Choose One",
              controller: state.typeController,
              suffixIcon: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: Colors.black,
              ),
              readOnly: true,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Please Choose One';
                }
                return null;
              },
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => CustomAlertDialog(
                    title: "Type >",
                    itemCount: _type.length,
                    fields: _type,
                    onItemSelected: (selectedItem) {
                      setState(() {
                        _selectedType = selectedItem;
                        state.typeController.text = _selectedType!;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
