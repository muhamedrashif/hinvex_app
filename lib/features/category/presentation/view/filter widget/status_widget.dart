import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/colors.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({super.key, required this.onTap, required this.value});
  final void Function(int? value) onTap;
  final int? value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (value == 1) {
              onTap.call(null);
            } else {
              onTap.call(1);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
            decoration: BoxDecoration(
              color:
                  value == 1 ? AppColors.blueColor : AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.titleTextColor,
              ),
            ),
            child: Center(
              child: Text(
                "Under Construction",
                style: TextStyle(
                  color: value == 1
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
            if (value == 2) {
              onTap.call(null);
            } else {
              onTap.call(2);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
            decoration: BoxDecoration(
              color:
                  value == 2 ? AppColors.blueColor : AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.titleTextColor,
              ),
            ),
            child: Center(
              child: Text(
                "Ready to Move",
                style: TextStyle(
                  color: value == 2
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
            if (value == 3) {
              onTap.call(null);
            } else {
              onTap.call(3);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
            decoration: BoxDecoration(
              color:
                  value == 3 ? AppColors.blueColor : AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.titleTextColor,
              ),
            ),
            child: Center(
              child: Text(
                "New Launch",
                style: TextStyle(
                  color: value == 3
                      ? AppColors.backgroundColor
                      : AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
