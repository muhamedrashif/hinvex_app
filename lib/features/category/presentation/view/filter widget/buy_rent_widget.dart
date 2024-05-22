import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

class BuyRentWidget extends StatelessWidget {
  const BuyRentWidget({super.key, required this.onTap, required this.value});
  final void Function(bool? value) onTap;
  final bool? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Im Looking to",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if (value == true) {
                  onTap.call(null);
                } else {
                  onTap.call(true);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
                decoration: BoxDecoration(
                  color: value == true
                      ? AppColors.blueColor
                      : AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.titleTextColor,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Buy",
                    style: TextStyle(
                      color: value == true
                          ? AppColors.backgroundColor
                          : AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (value == false) {
                  onTap.call(null);
                } else {
                  onTap.call(false);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
                decoration: BoxDecoration(
                  color: value == false
                      ? AppColors.blueColor
                      : AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.titleTextColor,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Rent",
                    style: TextStyle(
                      color: value == false
                          ? AppColors.backgroundColor
                          : AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
