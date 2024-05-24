import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/colors.dart';

Future<bool> showExitPopup(BuildContext context) async {
  return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: AppColors.backgroundColor,
          title: Text(
            'Exit App',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.titleTextColor,
            ),
          ),
          content: Text(
            'Do you want to exit',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.titleTextColor,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                //return false when click on "NO"
                child: Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.textButtonColor,
                    ),
                    child: const Center(
                        child: Text(
                      'No',
                      style: TextStyle(color: Colors.white),
                    ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () => exit(0),
                //return true when click on "Yes"
                child: Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.textButtonColor,
                    ),
                    child: const Center(
                        child: Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    ))),
              ),
            ),
          ],
        ),
      ) ??
      false; //if showDialouge had returned null, then return false
}
