import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading/popup_selection_widget.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';

class TypeInputWidget extends StatefulWidget {
  const TypeInputWidget({super.key});

  @override
  State<TypeInputWidget> createState() => _TypeInputWidgetState();
}

class _TypeInputWidgetState extends State<TypeInputWidget> {
  final TextEditingController _typeController = TextEditingController();

  // TYPE
  String? _selectedType;

  final List<String> _type = [
    'Sell',
    'Rent',
  ];

  @override
  Widget build(BuildContext context) {
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
            controller: _typeController,
            suffixIcon: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: Colors.black,
            ),
            suffixIcononTap: () {
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
                      _typeController.text = _selectedType!;
                    });
                  },
                ),
              );
            },
            readOnly: true,
          ),
        ),
      ],
    );
  }
}
