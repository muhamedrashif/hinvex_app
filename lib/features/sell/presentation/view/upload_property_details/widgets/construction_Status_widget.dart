import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/provider/sell_provider.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/aa_popup_selection_widget.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textformfield_widget.dart';
import 'package:provider/provider.dart';

class ConstructionStatusInputWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const ConstructionStatusInputWidget({super.key, required this.formKey});

  @override
  State<ConstructionStatusInputWidget> createState() =>
      _ConstructionStatusInputWidgetState();
}

class _ConstructionStatusInputWidgetState
    extends State<ConstructionStatusInputWidget> {
  // Construction Status
  String? _selectedConstructionStatus;

  final List<String> _constructionStatus = [
    'New Launch',
    'Ready To Move',
    'Under-Construction'
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<SellProvider>(builder: (context, state, _) {
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
              controller: state.constructionStatusController,
              suffixIcon: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: Colors.black,
              ),
              onTap: () {
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
                        state.constructionStatusController.text =
                            _selectedConstructionStatus!;
                      });
                    },
                  ),
                );
              },
              readOnly: true,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Please Choose One';
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
