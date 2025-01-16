import 'dart:async';

import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/app_constants.dart';
import 'package:crafty_bay/features/auth/ui/controller/otp_verification_controller.dart';
import 'package:crafty_bay/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:crafty_bay/features/common/ui/screen/main_bottom_nav_screen.dart';
import 'package:crafty_bay/features/common/ui/widget/app_logo_widget.dart';
import 'package:crafty_bay/features/common/ui/widget/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVarificationScreen extends StatefulWidget {
  const OtpVarificationScreen({super.key, required this.email});
  final String email;
  static const String name = '/otp-varification';

  @override
  State<OtpVarificationScreen> createState() => _OtpVarificationScreenState();
}

class _OtpVarificationScreenState extends State<OtpVarificationScreen> {
  final TextEditingController otpCtrl = TextEditingController();
  RxInt remainingTime = AppConstants.resenCodeOTPTimer.obs;
  late Timer timer;
  RxBool enableResendCodeButtom = false.obs;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  OTPVerificationController otpVerificationController =
      Get.find<OTPVerificationController>();

  @override
  void initState() {
    resendOTP();
    super.initState();
  }

  void resendOTP() {
    enableResendCodeButtom.value = false;
    remainingTime.value = 10;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (t) {
        // print(remainingTime.value);
        remainingTime.value--;
        if (remainingTime.value == 0) {
          t.cancel();
          enableResendCodeButtom.value = true;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              const AppLogoWidget(
                height: null,
                width: null,
                boxFit: null,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Enter OTP Code',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'A 6 digit OTP Code has been sent',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: 24,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    PinCodeTextField(
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      animationDuration: const Duration(milliseconds: 300),
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          selectedColor: Colors.green,
                          activeFillColor: AppColors.themecolor,
                          inactiveColor: AppColors.themecolor,
                          borderRadius: BorderRadius.circular(8)),
                      keyboardType: TextInputType.number,
                      appContext: context,
                      controller: otpCtrl,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              GetBuilder<OTPVerificationController>(
                builder: (controller) {
                  if (controller.inProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ElevatedButton(
                      onPressed: _onTapToNextButton,
                      child: const Text('Next'),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Obx(
                () => Visibility(
                  visible: !enableResendCodeButtom.value,
                  child: RichText(
                    text: TextSpan(
                      text: 'This code will be expire in ',
                      style: const TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: '${remainingTime}s',
                          style: const TextStyle(
                            color: AppColors.themecolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: enableResendCodeButtom.value,
                  child: TextButton(
                    onPressed: () {
                      resendOTP();
                    },
                    child: const Text('Resend code'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onTapToNextButton() async {
    if (_formKey.currentState!.validate()) {
    bool isSuccess =
        await otpVerificationController.verifyOTP(widget.email, otpCtrl.text);
    if (isSuccess) {
      if (otpVerificationController.shouldNavigateCompleteProfile!) {
        if (mounted) {
          Navigator.pushNamed(context, CompleteProfileScreen.name);
        }
      } else {
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
              context, MainBottomNavScreen.name, (predicate) => false);
        }
      }
    } else {
      if (mounted) {
        showSnackbarMessage(context, otpVerificationController.errorMessage!);
      }
    }
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
