import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hinvex_app/features/authentication/presentation/provider/auth_provider.dart';
import 'package:hinvex_app/features/location/presentation/view/location_sreen.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_button_widget.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_outLines_button_widget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_details.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/utils/progress_indicator_widget/progress_indicator_widget.dart';
import 'package:hinvex_app/general/utils/toast/toast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'widget/otpverification_widget.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController _mobileNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustumImage(
                image: ImageConstant.hinvexAppLogo,
                height: 21.85,
                width: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              CustumImage(
                image: ImageConstant.authentication,
                height: 132.6,
                width: 142.24,
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Mobile number",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 44,
                      width: 49,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.textButtonColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "IND",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.titleTextColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          maxLength: 10,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 14, 10, 8),
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: AppColors.titleTextColor,
                                width: .5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: AppColors.titleTextColor,
                                width: .5,
                              ),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: .5,
                              ),
                            ),
                            hintText: "Enter Phone Number",
                            hintStyle: const TextStyle(color: Colors.grey),
                          ),
                          controller: _mobileNumberController,
                          keyboardType: TextInputType.number,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Please Enter Phone Number';
                            }

                            if (text.length < 10 || text.length > 10) {
                              return 'Mobile Number must be of 10 digit';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                        children: [
                          const TextSpan(
                              text: "By Continuing, I agree to HenviX’s "),
                          TextSpan(
                            text: "Terms Of Use ",
                            style: TextStyle(color: Colors.blue[200]),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launchUrlString(AppDetails.termsAndCondition,
                                    mode: LaunchMode.externalApplication);
                              },
                          ),
                          const TextSpan(text: "& "),
                          TextSpan(
                            text: "privacy policy",
                            style: TextStyle(color: Colors.blue[200]),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launchUrlString(
                                  AppDetails.privacyAndPolicy,
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButtonWidget(
                  height: 44,
                  width: MediaQuery.of(context).size.width,
                  buttonColor: AppColors.textButtonColor,
                  text: "Get OTP",
                  textColor: AppColors.buttonTextColor,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      showProgress(context);
                      context.read<AuthenticationProvider>().verifyPhoneNumber(
                            phoneNumber: '+91${_mobileNumberController.text}',
                            onSuccess: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                isDismissible: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadiusDirectional.only(
                                    topEnd: Radius.circular(20),
                                    topStart: Radius.circular(20),
                                  ),
                                ),
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 16.0,
                                    ),
                                    child: OTPVerificationSheet(
                                      phoneNumber:
                                          '${AppDetails.contryCode}${_mobileNumberController.text}',
                                    ),
                                  );
                                },
                              );
                            },
                            onFailure: (value) {
                              showToast(value, backgroundColor: Colors.red);
                              Navigator.pop(context);
                            },
                          );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomOutLineButtonWidget(
                  height: 44,
                  width: MediaQuery.of(context).size.width,
                  text: "Skip",
                  textColor: Colors.grey,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LocationScreen(),
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
