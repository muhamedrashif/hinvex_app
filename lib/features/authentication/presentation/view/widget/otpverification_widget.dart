import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/presentation/provider/auth_provider.dart';
import 'package:hinvex_app/features/location/presentation/view/location_sreen.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_button_widget.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/text_widget.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/utils/progress_indicator_widget/progress_indicator_widget.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OTPVerificationSheet extends StatefulWidget {
  final String phoneNumber;

  const OTPVerificationSheet({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<OTPVerificationSheet> createState() => _OTPVerificationSheetState();
}

class _OTPVerificationSheetState extends State<OTPVerificationSheet> {
  TextEditingController otpController = TextEditingController();

  var otp;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            TextWidget(
              alignment: Alignment.centerLeft,
              text: "OTP Verification",
              fontWeight: FontWeight.bold,
              fontSize: 18,
              textColor: AppColors.titleTextColor,
            ),
            TextWidget(
              alignment: Alignment.centerLeft,
              text:
                  "Enter A verification code we just sent to your number +91${widget.phoneNumber}.",
              fontWeight: FontWeight.normal,
              fontSize: 13,
              textColor: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Pinput(
                autofocus: true,
                controller: otpController,
                defaultPinTheme: PinTheme(
                    height: 44.0,
                    width: 44.0,
                    textStyle: TextStyle(
                        color: AppColors.titleTextColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        border: Border.all(
                            color: AppColors.textButtonColor, width: 1.0))),
                length: 6,
                onChanged: (val) {
                  if (val.length == 6) {
                    otp = val;
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextWidget(
                  alignment: Alignment.centerLeft,
                  text: "59 Sec",
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  textColor: AppColors.titleTextColor,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButtonWidget(
                height: 44,
                width: MediaQuery.of(context).size.width,
                buttonColor: AppColors.textButtonColor,
                text: "Verify",
                textColor: AppColors.buttonTextColor,
                onTap: () {
                  showProgress(context);
                  context.read<AuthProvider>().verifySmsCode(
                        phoneNumber: widget.phoneNumber,
                        smsCode: otpController.text,
                        onSuccess: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LocationScreen(),
                              ));
                        },
                        onFailure: () {
                          Navigator.pop(context);
                        },
                      );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Get OTP? ",
                    style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                    ),
                  ),
                  const Text(
                    "Resend",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.red,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
