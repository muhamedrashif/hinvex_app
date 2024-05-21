import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/provider/sell_provider.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/aa_popup_selection_widget.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';
import 'package:provider/provider.dart';

class BHKInputWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const BHKInputWidget({super.key, required this.formKey});

  @override
  State<BHKInputWidget> createState() => _BHKInputWidgetState();
}

class _BHKInputWidgetState extends State<BHKInputWidget> {
  String? _selectedBHK;

  final List<Bhk> _bhk = [
    Bhk(name: '1+ BHK', value: 1),
    Bhk(name: '2+ BHK', value: 2),
    Bhk(name: '3+ BHK', value: 3),
    Bhk(name: '4+ BHK', value: 4),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<SellProvider>(builder: (context, state, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "BHK*",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CustomTextFormFieldWidget(
              hintText: "Choose One",
              controller: state.bHKController,
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
                    title: "BHK >",
                    itemCount: _bhk.length,
                    fields: _bhk.map((bhk) => bhk.name).toList(),
                    // onItemSelected: (selectedItem) {
                    //   setState(() {
                    //     _selectedBHK = selectedItem;
                    //     state.bHKController.text = _selectedBHK!;
                    //     _selectedBHKValue = _bhk
                    //         .firstWhere((bhk) => bhk.name == selectedItem)
                    //         .value;
                    //   });
                    // },

                    onItemSelected: (selectedItem) {
                      log("Selected Item: $selectedItem");
                      setState(() {
                        _selectedBHK = selectedItem;
                        state.bHKController.text = _selectedBHK!;
                        state.selectedBHKValue = _bhk
                            .firstWhere((bhk) => bhk.name == selectedItem,
                                orElse: () => Bhk(name: "", value: 0))
                            .value;
                        log("_selectedBHKValue: ${state.selectedBHKValue}");
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

class Bhk {
  final String name;
  final int value;
  Bhk({required this.name, required this.value});
}
