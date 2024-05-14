import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/data/model/user_details_model.dart';
import 'package:hinvex_app/features/authentication/presentation/provider/auth_provider.dart';
import 'package:hinvex_app/features/profile/presentation/provider/profile_provider.dart';
import 'package:hinvex_app/features/profile/presentation/view/widget/user_location_search.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_button_widget.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/utils/progress_indicator_widget/progress_indicator_widget.dart';
import 'package:hinvex_app/general/utils/toast/toast.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController whatsAppNumberController =
      TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, state, _) {
      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: AppColors.backgroundColor,
                iconTheme: IconThemeData(color: AppColors.titleTextColor),
                title: Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.titleTextColor,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 80,
                            width: 85,
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage(ImageConstant.userProfile),
                                  radius: 38,
                                ),
                                Positioned(
                                  bottom: -2,
                                  right: -61,
                                  child: CustumImage(
                                    image: ImageConstant.cameraIcon,
                                    height: 20,
                                    width: 200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Your Name*",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: state.userModel!.userName ??
                                      "Please Enter Name",
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                controller: nameController,
                                keyboardType: TextInputType.name,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              "Contact Number*",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: state.userModel!.userPhoneNumber,
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                controller: phoneNumberController,
                                keyboardType: TextInputType.name,
                                enabled: false,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              "WhatsApp Number*",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText:
                                      state.userModel!.userWhatsAppNumber ??
                                          "WhatsApp Number",
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                controller: whatsAppNumberController,
                                keyboardType: TextInputType.name,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              "Location*",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                  hintText:
                                      '${state.userModel!.userLocation!.localArea}, ${state.userModel!.userLocation!.district}',
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                controller: locationController,
                                keyboardType: TextInputType.name,
                                readOnly: true,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          UserLocationSearchWidget(
                                        userLocationController:
                                            locationController,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: CustomButtonWidget(
            height: 44,
            width: MediaQuery.of(context).size.width,
            buttonColor: AppColors.textButtonColor,
            text: "Upload",
            textColor: AppColors.buttonTextColor,
            onTap: () {
              showProgress(context);
              Provider.of<ProfileProvider>(context, listen: false)
                  .updateUserDetils(
                      userModel: UserModel(
                        id: state.userModel!.id,
                        isBlocked: state.userModel!.isBlocked,
                        notificationToken: state.userModel!.notificationToken,
                        partnership: state.userModel!.partnership,
                        startedDate: state.userModel!.startedDate,
                        totalPosts: state.userModel!.totalPosts,
                        userId: state.userModel!.userId,
                        userImage: state.userModel!.userImage,
                        userLocation:
                            Provider.of<ProfileProvider>(context, listen: false)
                                    .placeCellUserUpdatedLocation ??
                                state.userModel!.userLocation,
                        userName: nameController.text.isEmpty
                            ? state.userModel!.userName
                            : nameController.text,
                        userPhoneNumber: state.userModel!.userPhoneNumber,
                        userWhatsAppNumber:
                            whatsAppNumberController.text.isEmpty
                                ? state.userModel!.userWhatsAppNumber
                                : whatsAppNumberController.text,
                      ),
                      onSuccess: () {
                        showToast(
                          "Edit Success",
                        );
                        Navigator.pop(context);
                      },
                      onFailure: () {
                        showToast("Edit Failed");
                      });
            },
          ),
        ),
      );
    });
  }
}
