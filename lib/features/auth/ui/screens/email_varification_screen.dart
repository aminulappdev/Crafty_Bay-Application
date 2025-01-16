import 'package:crafty_bay/features/auth/ui/controller/email_verification_controller.dart';
import 'package:crafty_bay/features/auth/ui/screens/otp_varification_screen.dart';
import 'package:crafty_bay/features/common/ui/widget/app_logo_widget.dart';
import 'package:crafty_bay/features/common/ui/widget/snack_bar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVarificationScreen extends StatefulWidget {
  const EmailVarificationScreen({super.key});

  static const String name = '/email-varification';

  @override
  State<EmailVarificationScreen> createState() =>
      _EmailVarificationScreenState();
}

class _EmailVarificationScreenState extends State<EmailVarificationScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  EmailVerificationController emailVerificationController =
      Get.find<EmailVerificationController>();

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
                boxFit: null,
                width: null,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Welcome Back',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Please enter your email address',
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
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailCtrl,
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Enter your email address";
                        }
                        if (EmailValidator.validate(value!) == false) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(hintText: 'Email Address'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              GetBuilder<EmailVerificationController>(builder: (controller) {
                if (controller.inProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ElevatedButton(
                      onPressed: _onTapToNextButton, child: const Text('Next'));
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  void _onTapToNextButton() async {
    if (_formKey.currentState!.validate()) {
    bool isSuccess =
        await emailVerificationController.verifyEmail(emailCtrl.text.trim());
    if (isSuccess) {
      if (mounted) {
        Navigator.pushNamed(context, OtpVarificationScreen.name,
            arguments: emailCtrl.text);
      }
    } else {
      if (mounted) {
        showSnackbarMessage(context, emailVerificationController.errorMessage!);
      }
    }
     }
    //   else {
    //   print('Not valid...............................................');
    // }
  }
}
