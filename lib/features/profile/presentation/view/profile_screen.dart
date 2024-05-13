import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hinvex_app/features/authentication/data/model/user_details_model.dart';
import 'package:hinvex_app/features/profile/presentation/provider/profile_provider.dart';
import 'package:hinvex_app/features/profile/presentation/view/customer_support_screen.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:provider/provider.dart';

import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Provider.of<ProfileProvider>(context, listen: false).fetchUser();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, state, _) {
        return state.fetchUserLoading
            ? CircularProgressIndicator.adaptive()
            // : StreamBuilder<DocumentSnapshot>(
            //     stream: FirebaseFirestore.instance
            //         .collection('users')
            //         .doc(FirebaseAuth.instance.currentUser!.uid)
            //         .snapshots(),
            //     builder: (context, snapshot) {
            //       log(FirebaseAuth.instance.currentUser!.uid.toString());
            //       if (snapshot.hasData && snapshot.data!.exists) {
            //         final userData =
            //             snapshot.data!.data() as Map<String, dynamic>;
            //         final users = UserModel.fromSnap(userData);

            : Scaffold(
                backgroundColor: AppColors.backgroundColor,
                body: SafeArea(
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        backgroundColor: AppColors.backgroundColor,
                        iconTheme:
                            IconThemeData(color: AppColors.titleTextColor),
                        title: Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.titleTextColor,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage(ImageConstant.userProfile),
                                radius: 38,
                              ),
                            ),
                            Text(
                              "Hello, UserName",
                              // state.fetchUserList.first.userName!,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustumImage(
                                  image: ImageConstant.memberCard,
                                  height: 24,
                                  width: 24,
                                ),
                                Text(
                                  "Member Since Dec 2021",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: AppColors.titleTextColor),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                height: 136,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "My Activities",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: AppColors.titleTextColor),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 14.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "My Ads",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: AppColors
                                                      .subtitleTextColor),
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 14.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "My Shortlists",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: AppColors
                                                      .subtitleTextColor),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 12,
                                              color: AppColors.titleTextColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: Container(
                                height: 301,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Settings",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: AppColors.titleTextColor),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 20.0,
                                          bottom: 10,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Notification",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: AppColors
                                                      .subtitleTextColor),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 12,
                                              color: AppColors.titleTextColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EditProfileScreen(),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Edit Profile",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: AppColors
                                                        .subtitleTextColor),
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
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CustomerSupportScreen(),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Customer Support",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: AppColors
                                                        .subtitleTextColor),
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Share App",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: AppColors
                                                      .subtitleTextColor),
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Rate This App",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: AppColors
                                                      .subtitleTextColor),
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Logout",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: AppColors
                                                      .subtitleTextColor),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 12,
                                              color: AppColors.titleTextColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 25.0),
                              child: Text(
                                "Updation Available 2.2.3",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}
