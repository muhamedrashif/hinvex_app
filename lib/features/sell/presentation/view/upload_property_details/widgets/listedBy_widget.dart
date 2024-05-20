import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/provider/sell_provider.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/aa_popup_selection_widget.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';
import 'package:provider/provider.dart';

class ListedByInputWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const ListedByInputWidget({super.key, required this.formKey});

  @override
  State<ListedByInputWidget> createState() => _ListedByInputWidgetState();
}

class _ListedByInputWidgetState extends State<ListedByInputWidget> {
  // ListedBy
  String? _selectedListedBy;

  final List<String> _listedBy = ['Builder', 'Dealer', 'Owner'];

  @override
  Widget build(BuildContext context) {
    return Consumer<SellProvider>(builder: (context, state, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Listed By*",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CustomTextFormFieldWidget(
              hintText: "Choose One",
              controller: state.listedByController,
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
                    title: "ListedBy >",
                    itemCount: _listedBy.length,
                    fields: _listedBy,
                    onItemSelected: (selectedItem) {
                      setState(() {
                        _selectedListedBy = selectedItem;
                        state.listedByController.text = _selectedListedBy!;
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
