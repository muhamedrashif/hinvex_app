import 'package:flutter/material.dart';

class CustomSlideIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final Color selectedColor;
  final Color unselectedColor;
  final Color selectedBorderColor;
  final Color unselectedBorderColor;

  const CustomSlideIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
    required this.selectedColor,
    required this.unselectedColor,
    required this.selectedBorderColor,
    required this.unselectedBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 1),
          width: currentIndex == index ? 20 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentIndex == index ? selectedColor : unselectedColor,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: currentIndex == index
                  ? selectedBorderColor
                  : unselectedBorderColor,
              width: 1,
            ),
          ),
        );
      }),
    );
  }
}
