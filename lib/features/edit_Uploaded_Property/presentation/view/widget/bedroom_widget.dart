import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/aa_popup_selection_widget.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';
import 'package:provider/provider.dart';

import '../../provider/edit_proprty_provider.dart';

class BedRoomInputEditWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const BedRoomInputEditWidget({super.key, required this.formKey});

  @override
  State<BedRoomInputEditWidget> createState() => _BedRoomInputEditWidgetState();
}

class _BedRoomInputEditWidgetState extends State<BedRoomInputEditWidget> {
  final List<String> _bedRoom = ['1', '2', '3', '4', '+4'];

  @override
  Widget build(BuildContext context) {
    return Consumer<EditPropertProvider>(builder: (context, state, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Bedroom*",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CustomTextFormFieldWidget(
              hintText: "Choose One",
              controller: state.bedRoomController,
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
                    title: "BedRoom >",
                    itemCount: _bedRoom.length,
                    fields: _bedRoom,
                    onItemSelected: (selectedItem) {
                      setState(() {
                        state.bedRoomController.text = selectedItem;
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
