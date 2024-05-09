import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';

class TypeInputWidget extends StatelessWidget {
  TypeInputWidget({super.key});
  final TextEditingController _locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Type*",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: CustomTextFormFieldWidget(
            hintText: "Choose One",
            controller: _locationController,
            suffixIcon: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: Colors.black,
            ),
            suffixIcononTap: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
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
                                color: AppColors.titleTextColor),
                          )),
                    ),
                  ],
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
