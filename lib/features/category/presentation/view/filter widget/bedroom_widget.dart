import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/colors.dart';

class BedRoomWidget extends StatelessWidget {
  const BedRoomWidget({super.key, required this.onTap, required this.value});
  final void Function(int? value) onTap;
  final int? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bedroom",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
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
                padding: const EdgeInsets.only(
                    left: 15, bottom: 10, top: 10, right: 15),
                margin: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
                decoration: BoxDecoration(
                  color: value == 1
                      ? AppColors.blueColor
                      : AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.titleTextColor,
                  ),
                ),
                child: Center(
                  child: Text(
                    "+1",
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
                padding: const EdgeInsets.only(
                    left: 15, bottom: 10, top: 10, right: 15),
                margin: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
                decoration: BoxDecoration(
                  color: value == 2
                      ? AppColors.blueColor
                      : AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.titleTextColor,
                  ),
                ),
                child: Center(
                  child: Text(
                    "+2",
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
                padding: const EdgeInsets.only(
                    left: 15, bottom: 10, top: 10, right: 15),
                margin: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
                decoration: BoxDecoration(
                  color: value == 3
                      ? AppColors.blueColor
                      : AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.titleTextColor,
                  ),
                ),
                child: Center(
                  child: Text(
                    "+3",
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
            GestureDetector(
              onTap: () {
                if (value == 4) {
                  onTap.call(null);
                } else {
                  onTap.call(4);
                }
              },
              child: Container(
                padding: const EdgeInsets.only(
                    left: 15, bottom: 10, top: 10, right: 15),
                margin: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
                decoration: BoxDecoration(
                  color: value == 4
                      ? AppColors.blueColor
                      : AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.titleTextColor,
                  ),
                ),
                child: Center(
                  child: Text(
                    "+4",
                    style: TextStyle(
                      color: value == 4
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
                if (value == 5) {
                  onTap.call(null);
                } else {
                  onTap.call(5);
                }
              },
              child: Container(
                padding: const EdgeInsets.only(
                    left: 15, bottom: 10, top: 10, right: 15),
                margin: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
                decoration: BoxDecoration(
                  color: value == 5
                      ? AppColors.blueColor
                      : AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.titleTextColor,
                  ),
                ),
                child: Center(
                  child: Text(
                    "+5",
                    style: TextStyle(
                      color: value == 5
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
