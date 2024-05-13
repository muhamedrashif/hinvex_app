import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/provider/sell_provider.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/aa_popup_selection_widget.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';
import 'package:provider/provider.dart';

class FurnishingInputWidget extends StatefulWidget {
  const FurnishingInputWidget({super.key});

  @override
  State<FurnishingInputWidget> createState() => _FurnishingInputWidgetState();
}

class _FurnishingInputWidgetState extends State<FurnishingInputWidget> {
  final List<String> _furnishing = [
    'Furnished',
    'Semi-Furnished',
    'Un-Furnished'
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<SellProvider>(builder: (context, state, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Furnishing*",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CustomTextFormFieldWidget(
              hintText: "Choose One",
              controller: state.furnishingController,
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
                    title: "Furnishing >",
                    itemCount: _furnishing.length,
                    fields: _furnishing,
                    onItemSelected: (selectedItem) {
                      setState(() {
                        state.furnishingController.text = selectedItem;
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
    });
  }
}