import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final Color buttonColor;
  final String text;
  final Color textColor;
  final VoidCallback? onTap;

  const CustomButtonWidget({
    super.key,
    required this.height,
    required this.width,
    required this.buttonColor,
    required this.text,
    required this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: buttonColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
