import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/popup_selection_widget.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';

class BathRoomInputWidget extends StatefulWidget {
  const BathRoomInputWidget({super.key});

  @override
  State<BathRoomInputWidget> createState() => _BathRoomInputWidgetState();
}

class _BathRoomInputWidgetState extends State<BathRoomInputWidget> {
  final TextEditingController _bathRoomController = TextEditingController();

  // BathRoom
  String? _selectedBathRoom;

  final List<String> _bathRoom = ['1', '2', '3', '4', '+4'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Bathroom*",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: CustomTextFormFieldWidget(
            hintText: "Choose One",
            controller: _bathRoomController,
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
                  title: "BathRoom >",
                  itemCount: _bathRoom.length,
                  fields: _bathRoom,
                  onItemSelected: (selectedItem) {
                    setState(() {
                      _selectedBathRoom = selectedItem;
                      _bathRoomController.text = _selectedBathRoom!;
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
