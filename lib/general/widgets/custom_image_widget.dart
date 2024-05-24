import 'package:flutter/material.dart';

class CustumImage extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final AlignmentGeometry? alignment;

  const CustumImage({
    super.key,
    required this.image,
    required this.height,
    required this.width,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: height,
          width: width,
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
