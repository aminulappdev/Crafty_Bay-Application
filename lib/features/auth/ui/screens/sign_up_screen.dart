import 'package:crafty_bay/features/auth/data/models/sign_up_params.dart';
import 'package:crafty_bay/features/auth/ui/controller/sign_up_controller.dart';
import 'package:crafty_bay/features/auth/ui/controller/otp_verification_controller.dart';
import 'package:crafty_bay/features/auth/ui/screens/otp_varification_screen.dart';
import 'package:crafty_bay/features/common/ui/screen/main_bottom_nav_screen.dart';
import 'package:crafty_bay/features/common/ui/widget/app_logo_widget.dart';
import 'package:crafty_bay/features/common/ui/widget/snack_bar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/complete-profile';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

//     "first_name": "Meskatul",
//     "last_name": "Islam",
//     "email": "admin@mail.com",
//     "password": "123456",
//     "phone": "01754658781",
//     "city": "Chattogram"

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController firstNameCtrl = TextEditingController();
  final TextEditingController lastNameCtrl = TextEditingController();
  final TextEditingController mobileCtrl = TextEditingController();
  final TextEditingController cityCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final SignUpController signUpController = Get.find<SignUpController>();
  final OTPVerificationController otpVerificationController =
      Get.find<OTPVerificationController>();

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
                height: 100,
                width: 100,
                boxFit: null,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Complete Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Get start with us width your datails',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: 24,
              ),
              buildForm(),
              const SizedBox(
                height: 24,
              ),
              GetBuilder<SignUpController>(
                builder: (controller) {
                  return Visibility(
                    visible: controller.inprogress == false,
                    replacement: const Center(child: CircularProgressIndicator()),
                    child: ElevatedButton(
                        onPressed: _onTapToNextButton, child: const Text('Sign Up')),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildForm() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              controller: emailCtrl,
              textInputAction: TextInputAction.next,
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
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: firstNameCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your first name";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'First Name'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: lastNameCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your last name";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Last Name'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
              maxLength: 11,
              controller: mobileCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your Mobile";
                }
                if (RegExp(r'^01[3-9]\d{8}$').hasMatch(value!) == false) {
                  return "Enter your valid Mobile";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Phone'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              maxLines: 3,
              controller: cityCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your city";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'City'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: passwordCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your password";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onTapToNextButton() async {
    if (_formKey.currentState!.validate()) {
      SignUpParams signUpParams = SignUpParams(passwordCtrl.text,
          email: emailCtrl.text.trim(),
          firstName: firstNameCtrl.text.trim(),
          lastName: lastNameCtrl.text.trim(),
          mobile: mobileCtrl.text.trim(),
          city: cityCtrl.text.trim());

      bool isSuccess = await signUpController.signUp(signUpParams);
      if (isSuccess) {
        if (mounted) {
          clearText();
          Navigator.pushNamed(
              context, OtpVarificationScreen.name ,arguments: emailCtrl.text);
          showSnackbarMessage(context, 'Success');
        }
      } else {
        if (mounted) {
          showSnackbarMessage(context, signUpController.errorMessage!);
        }
      }
    }
  }

  void clearText() {
    emailCtrl.clear();
    firstNameCtrl.clear();
    lastNameCtrl.clear();
    mobileCtrl.clear();
    cityCtrl.clear();
    passwordCtrl.clear();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    mobileCtrl.dispose();
    passwordCtrl.dispose();
    cityCtrl.dispose();
    super.dispose();
  }
}
