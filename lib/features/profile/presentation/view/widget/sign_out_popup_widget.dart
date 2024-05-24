import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/presentation/provider/auth_provider.dart';
import 'package:hinvex_app/features/authentication/presentation/view/authentocation_screen.dart';
import 'package:hinvex_app/general/utils/colors.dart';
import 'package:provider/provider.dart';

class SignOutConfirmationDialog extends StatelessWidget {
  const SignOutConfirmationDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundColor,
      title: Text(
        'Logout',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.titleTextColor,
        ),
      ),
      content: Text(
        'Do you want to Logout',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.titleTextColor,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            //return false when click on "NO"
            child: Container(
                height: 30,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.textButtonColor,
                ),
                child: const Center(
                    child: Text(
                  'No',
                  style: TextStyle(color: Colors.white),
                ))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: () {
              // final prefs = await SharedPreferences.getInstance();
              // prefs.setBool('isLoggedIn', false);
              // prefs.setString('phone_number', "");
              // prefs.setString('save_location', "");

              Provider.of<AuthenticationProvider>(context, listen: false)
                  .signOut(context);

              Navigator.pushAndRemoveUntil(
                // ignore: use_build_context_synchronously
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AuthenticationScreen();
                  },
                ),
                (route) => false,
              );
            },
            child: Container(
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.textButtonColor,
                ),
                child: const Center(
                    child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ))),
          ),
        ),
      ],
    );
  }
}

// 7025492129
