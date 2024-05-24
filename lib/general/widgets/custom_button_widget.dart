import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final Color buttonColor;
  final String text;
  final Color textColor;
  final IconData? icon;
  final VoidCallback? onTap;

  const CustomButtonWidget({
    super.key,
    required this.height,
    required this.width,
    required this.buttonColor,
    required this.text,
    required this.textColor,
    this.icon,
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
          child: (icon == null)
              ? Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
