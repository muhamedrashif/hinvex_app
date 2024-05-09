import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Text(
        'Type >',
        style: TextStyle(fontSize: 13),
      ),
      content: ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              log("message");
            },
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                border: Border(
                  bottom: index != 1
                      ? BorderSide(
                          color: Colors.grey.shade400,
                          width: 1.0,
                        )
                      : BorderSide.none,
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Buy',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Text(
              'CANCEL',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: AppColors.titleTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
