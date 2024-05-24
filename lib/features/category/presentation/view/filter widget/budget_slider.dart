import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/colors.dart';
import 'package:intl/intl.dart';

class BudgetSlider extends StatelessWidget {
  final double currentSliderValue;
  final double maxLength;
  final void Function(double) onChanged;
  const BudgetSlider(
      {super.key,
      required this.currentSliderValue,
      required this.maxLength,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    String formattedNumber =
        NumberFormat('#,###').format(currentSliderValue.round());
    String maxformattedNumber = NumberFormat('#,###').format(maxLength);
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Budget",
            style: TextStyle(
                color: AppColors.primaryColor, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("0"),
              Text("$maxformattedNumber+"),
            ],
          ),
          Slider(
            value: currentSliderValue,
            max: maxLength,
            activeColor: AppColors.blueColor,
            // divisions: 5,
            label: currentSliderValue.round().toString(),
            onChanged: onChanged,
          ),
          Text(
            formattedNumber.toString(),
            style: TextStyle(
                color: AppColors.primaryColor, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
