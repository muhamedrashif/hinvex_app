import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/presentation/view/authentocation_screen.dart';
import 'package:hinvex_app/features/myads/presentation/view/myads_screen.dart';
import 'package:hinvex_app/features/shortlists/presentation/view/shortlists_screen.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

class ActivitiesWidget extends StatelessWidget {
  const ActivitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        // height: 136,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3,
              spreadRadius: 3,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "My Activities",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.titleTextColor),
              ),
              InkWell(
                onTap: () {
                  if (FirebaseAuth.instance.currentUser == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthenticationScreen(),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyAdsScreen(),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Ads",
                        style: TextStyle(
                            fontSize: 14, color: AppColors.subtitleTextColor),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 12,
                        color: AppColors.titleTextColor,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (FirebaseAuth.instance.currentUser == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShortListsScreen(),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyAdsScreen(),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Shortlists",
                        style: TextStyle(
                            fontSize: 14, color: AppColors.subtitleTextColor),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 12,
                        color: AppColors.titleTextColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
