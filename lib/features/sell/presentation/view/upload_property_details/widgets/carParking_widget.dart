import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/widgets/popup_selection_widget.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';

class CarParkingInputWidget extends StatefulWidget {
  const CarParkingInputWidget({super.key});

  @override
  State<CarParkingInputWidget> createState() => _CarParkingInputWidgetState();
}

class _CarParkingInputWidgetState extends State<CarParkingInputWidget> {
  final TextEditingController _carParkingController = TextEditingController();

  // Construction Status
  String? _selectedCarParking;

  final List<String> _carParking = ['1', '2', '3', '4', '+4'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Car Parking*",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: CustomTextFormFieldWidget(
            hintText: "Choose One",
            controller: _carParkingController,
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
                  title: "Car Parking >",
                  itemCount: _carParking.length,
                  fields: _carParking,
                  onItemSelected: (selectedItem) {
                    setState(() {
                      _selectedCarParking = selectedItem;
                      _carParkingController.text = _selectedCarParking!;
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
