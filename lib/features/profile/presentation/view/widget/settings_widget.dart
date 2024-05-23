import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/presentation/view/authentocation_screen.dart';
import 'package:hinvex_app/features/notification/presentation/view/notification_screen.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

import '../customer_support_screen.dart';
import '../edit_profile_screen.dart';
import 'sign_out_popup_widget.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Container(
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
                "Settings",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.titleTextColor),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Notification",
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
                        builder: (context) => const AuthenticationScreen(),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Edit Profile",
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomerSupportScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Customer Support",
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Share App",
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rate This App",
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
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return const SignOutConfirmationDialog();
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Logout",
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
