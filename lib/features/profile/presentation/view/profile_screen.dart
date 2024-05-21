import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/presentation/provider/auth_provider.dart';
import 'package:hinvex_app/features/profile/presentation/view/widget/settings_widget.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'widget/activities_widget.dart';

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
    return Consumer<AuthProvider>(
      builder: (context, state, _) {
        log(state.userModel!.id!);
        DateTime postDate = state.userModel!.startedDate!.toDate();
        String formattedDate = DateFormat('MMM yyyy').format(postDate);

        return
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

            Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body:
              // state.fetchUserLoading
              //     ? const Center(child: CircularProgressIndicator())
              //     :
              SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: AppColors.backgroundColor,
                  iconTheme: IconThemeData(color: AppColors.titleTextColor),
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
                      state.userModel!.userImage != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    state.userModel!.userImage.toString()),
                                radius: 38,
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage(ImageConstant.userProfile),
                                radius: 38,
                              ),
                            ),
                      Text(
                        "Hello, ${state.userModel!.userName ?? ''}",
                        style: const TextStyle(
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
                            "Member Since $formattedDate",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: AppColors.titleTextColor),
                          ),
                        ],
                      ),
                      const ActivitiesWidget(),
                      const SettingsWidget(),
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
