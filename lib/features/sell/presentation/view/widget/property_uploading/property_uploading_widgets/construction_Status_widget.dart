import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading/popup_selection_widget.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';

class ConstructionStatusInputWidget extends StatefulWidget {
  const ConstructionStatusInputWidget({super.key});

  @override
  State<ConstructionStatusInputWidget> createState() =>
      _ConstructionStatusInputWidgetState();
}

class _ConstructionStatusInputWidgetState
    extends State<ConstructionStatusInputWidget> {
  final TextEditingController _constructionStatusController =
      TextEditingController();

  // Construction Status
  String? _selectedConstructionStatus;

  final List<String> _constructionStatus = [
    'New Launch',
    'Ready To Move',
    'Uder-Construction'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Construction Status*",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: CustomTextFormFieldWidget(
            hintText: "Choose One",
            controller: _constructionStatusController,
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
                  title: "Construction Status >",
                  itemCount: _constructionStatus.length,
                  fields: _constructionStatus,
                  onItemSelected: (selectedItem) {
                    setState(() {
                      _selectedConstructionStatus = selectedItem;
                      _constructionStatusController.text =
                          _selectedConstructionStatus!;
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
