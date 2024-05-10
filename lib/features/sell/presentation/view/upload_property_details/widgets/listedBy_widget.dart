import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/popup_selection_widget.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';

class ListedByInputWidget extends StatefulWidget {
  const ListedByInputWidget({super.key});

  @override
  State<ListedByInputWidget> createState() => _ListedByInputWidgetState();
}

class _ListedByInputWidgetState extends State<ListedByInputWidget> {
  final TextEditingController _listedByController = TextEditingController();

  // ListedBy
  String? _selectedListedBy;

  final List<String> _listedBy = [
    'Builder',
    'Dealer',
  ];

  @override
  Widget build(BuildContext context) {
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
            controller: _listedByController,
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
                  title: "ListedBy >",
                  itemCount: _listedBy.length,
                  fields: _listedBy,
                  onItemSelected: (selectedItem) {
                    setState(() {
                      _selectedListedBy = selectedItem;
                      _listedByController.text = _selectedListedBy!;
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
