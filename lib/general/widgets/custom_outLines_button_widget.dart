import 'package:flutter/material.dart';

class CustomOutLineButtonWidget extends StatelessWidget {
  final String text;
  final Color textColor;

  final double height;
  final double width;
  final VoidCallback? onTap;
  const CustomOutLineButtonWidget({
    super.key,
    this.onTap,
    required this.height,
    required this.width,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
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
