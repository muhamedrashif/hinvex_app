import 'package:flutter/material.dart';
import 'package:hinvex_app/features/onboard/data/model/onboard_model.dart';
import 'package:hinvex_app/general/utils/colors.dart';

class OnBoardFrame extends StatelessWidget {
  const OnBoardFrame({super.key, required this.onboardModel});
  final OnboardModel onboardModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          onboardModel.image,
          fit: BoxFit.contain,
          height: 183.29,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 280,
          child: Text(
            // textAlign: TextAlign.center,
            onboardModel.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              color: AppColors.titleTextColor,
            ),
          ),
        ),
        Text(
          // textAlign: TextAlign.left,
          onboardModel.content,
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 13, color: Colors.grey),
        ),
      ],
    );
  }
}
