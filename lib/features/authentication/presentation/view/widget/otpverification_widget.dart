import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/presentation/provider/auth_provider.dart';
import 'package:hinvex_app/features/location/presentation/view/location_sreen.dart';
import 'package:hinvex_app/general/widgets/custom_button_widget.dart';
import 'package:hinvex_app/general/utils/colors.dart';
import 'package:hinvex_app/general/utils/progress_indicator_widget/progress_indicator_widget.dart';
import 'package:hinvex_app/general/utils/toast/toast.dart';
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
  @override
  void initState() {
    context.read<AuthenticationProvider>().startTimer();
    super.initState();
  }

  @override
  void dispose() {
    context.read<AuthenticationProvider>().timer?.cancel();
    super.dispose();
  }

  // ignore: prefer_typing_uninitialized_variables
  var otp;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) {
        context.read<AuthenticationProvider>().clearData();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Consumer<AuthenticationProvider>(builder: (context, state, _) {
            return Column(
              children: [
                Text(
                  "OTP Verification",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.titleTextColor,
                  ),
                ),
                Text(
                  "Enter A verification code we just sent to your number +91${widget.phoneNumber}.",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                    color: Colors.grey,
                  ),
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
                    Text(
                      "${state.countDown} Sec",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColors.titleTextColor,
                      ),
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
                      state.verifySmsCode(
                        phoneNumber: widget.phoneNumber,
                        smsCode: otpController.text,
                        onSuccess: () {
                          context.read<AuthenticationProvider>().clearData();
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LocationScreen(),
                              ));
                        },
                        onFailure: (value) {
                          showToast(value, backgroundColor: Colors.red);
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
                      state.countDown != 0
                          ? Text(
                              "Resend",
                              style: TextStyle(
                                color: AppColors.titleTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.titleTextColor,
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                showProgress(context);
                                state.resendOtp();
                                context
                                    .read<AuthenticationProvider>()
                                    .verifyPhoneNumber(
                                      phoneNumber: widget.phoneNumber,
                                      onSuccess: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LocationScreen(),
                                            ));
                                      },
                                      onFailure: (value) {
                                        showToast(value,
                                            backgroundColor: Colors.red);
                                        Navigator.pop(context);
                                      },
                                    );
                              },
                              child: const Text(
                                "Resend",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.red,
                                ),
                              ),
                            ),
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
