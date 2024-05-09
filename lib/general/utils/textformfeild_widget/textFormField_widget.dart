import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final int? maxLength;
  final int? maxLines;
  final bool readOnly;
  final Function()? suffixIcononTap;

  const CustomTextFormFieldWidget({
    super.key,
    this.controller,
    this.hintText,
    this.validator,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.maxLines,
    this.readOnly = false,
    this.suffixIcononTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 3,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: GestureDetector(
              onTap: suffixIcononTap,
              child: SizedBox(
                height: 44,
                width: 44,
                child: suffixIcon,
              ),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.normal),
          ),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          controller: controller,
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLines: maxLines,
          readOnly: readOnly,
          validator: validator,
        ),
      ),
    );
  }
}
