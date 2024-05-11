import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/provider/sell_provider.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/aa_popup_selection_widget.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';
import 'package:provider/provider.dart';

class BedRoomInputWidget extends StatefulWidget {
  const BedRoomInputWidget({super.key});

  @override
  State<BedRoomInputWidget> createState() => _BedRoomInputWidgetState();
}

class _BedRoomInputWidgetState extends State<BedRoomInputWidget> {
  final List<String> _bedRoom = ['1', '2', '3', '4', '+4'];

  @override
  Widget build(BuildContext context) {
    return Consumer<SellProvider>(builder: (context, state, _) {
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
              suffixIcononTap: () {
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
            ),
          ),
        ],
      );
    });
  }
}
