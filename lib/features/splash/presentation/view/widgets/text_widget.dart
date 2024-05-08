import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color textColor;
  final Alignment alignment;

  const TextWidget({
    super.key,
    required this.text,
    required this.fontWeight,
    required this.fontSize,
    required this.textColor,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 8),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
