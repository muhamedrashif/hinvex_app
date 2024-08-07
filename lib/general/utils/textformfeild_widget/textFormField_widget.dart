import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/colors.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final int? maxLength;
  final int? maxLines;
  final double? height;
  final bool readOnly;
  final Function()? onTap;
  final TextStyle? hintStyle;
  final ValueChanged<String>? onChanged;

  const CustomTextFormFieldWidget({
    super.key,
    this.controller,
    this.hintText,
    this.validator,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.maxLines,
    this.height,
    this.readOnly = false,
    this.onTap,
    this.hintStyle = const TextStyle(
        color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal),
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.containerColor,
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextFormField(
          onTap: onTap,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: SizedBox(
              height: 44,
              width: 44,
              child: suffixIcon,
            ),
            hintText: hintText,
            hintStyle: hintStyle,
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
          onChanged: onChanged,
        ),
      ),
    );
  }
}
