import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading/popup_selection_widget.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';

class BedRoomInputWidget extends StatefulWidget {
  const BedRoomInputWidget({super.key});

  @override
  State<BedRoomInputWidget> createState() => _BedRoomInputWidgetState();
}

class _BedRoomInputWidgetState extends State<BedRoomInputWidget> {
  final TextEditingController _bedRoomController = TextEditingController();

  // BedRoom
  String? _selectedBedRoom;

  final List<String> _bedRoom = ['1', '2', '3', '4', '+4'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "BedRoom*",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: CustomTextFormFieldWidget(
            hintText: "Choose One",
            controller: _bedRoomController,
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
                      _selectedBedRoom = selectedItem;
                      _bedRoomController.text = _selectedBedRoom!;
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
