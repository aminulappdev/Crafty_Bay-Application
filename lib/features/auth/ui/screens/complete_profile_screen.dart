import 'package:crafty_bay/features/auth/ui/controller/complete_profile_controller.dart';
import 'package:crafty_bay/features/auth/ui/controller/otp_verification_controller.dart';
import 'package:crafty_bay/features/common/ui/screen/main_bottom_nav_screen.dart';
import 'package:crafty_bay/features/common/ui/widget/app_logo_widget.dart';
import 'package:crafty_bay/features/common/ui/widget/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  static const String name = '/complete-profile';

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController cusNameCtrl = TextEditingController();
  final TextEditingController cusmobileCtrl = TextEditingController();
  final TextEditingController cuscityCtrl = TextEditingController();
  final TextEditingController cusAddressCtrl = TextEditingController();
  final TextEditingController cusStateCtrl = TextEditingController();
  final TextEditingController cusPostCodeCtrl = TextEditingController();
  final TextEditingController cusCountryCtrl = TextEditingController();
  final TextEditingController cusFaxCtrl = TextEditingController();
  // -------------------------------------------------------------------------
  final TextEditingController shipNameCtrl = TextEditingController();
  final TextEditingController shipingAddressCtrl = TextEditingController();
  final TextEditingController shipCityCtrl = TextEditingController();
  final TextEditingController shipStateCtrl = TextEditingController();
  final TextEditingController shipPostCodeCtrl = TextEditingController();
  final TextEditingController shipCountryCtrl = TextEditingController();
  final TextEditingController shipPhoneCtrl = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final CompleteProfileController completeProfileController =
      Get.find<CompleteProfileController>();
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
              ElevatedButton(
                  onPressed: _onTapToNextButton, child: const Text('Next'))
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
              controller: cusNameCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your name";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Coustomer Name'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
              maxLength: 11,
              controller: cusmobileCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your Mobile";
                }
                if (RegExp(r'^01[3-9]\d{8}$').hasMatch(value!) == false) {
                  return "Enter your valid Mobile";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Coustomer Phone'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              maxLines: 3,
              controller: cusAddressCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your coustomer address";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Coustomer Address'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: cuscityCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your City";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Coustomer City'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: cusStateCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your coustomer state";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Coustomer State'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: cusPostCodeCtrl,
              keyboardType: TextInputType.number,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your coustomer postCode";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Coustomer PostCode'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: cusCountryCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your coustomer country";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Coustomer Country'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
              maxLength: 11,
              controller: cusFaxCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your shipping phone";
                }
                if (RegExp(r'^01[3-9]\d{8}$').hasMatch(value!) == false) {
                  return "Enter your coustomer fax";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Coustomer Fax'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: shipNameCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your shipping name";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Shipping Name'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
              maxLength: 11,
              controller: shipPhoneCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your shipping phone";
                }
                if (RegExp(r'^01[3-9]\d{8}$').hasMatch(value!) == false) {
                  return "Enter your valid Mobile";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Shipping Mobile'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              maxLines: 3,
              controller: shipingAddressCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your shiping address";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Shipping Address'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: shipCityCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your shipping city";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Shipping City'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: shipStateCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your shipping state";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Shipping State'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
              controller: shipPostCodeCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your shipping postCode";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Shipping PostCode'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: shipCountryCtrl,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter your shipping country";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Shipping Country'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onTapToNextButton() async {
    if (_formKey.currentState!.validate()) {
      bool isSuccess = await completeProfileController.completeProfile(
          cusNameCtrl.text.trim(),
          cusmobileCtrl.text.trim(),
          cuscityCtrl.text.trim(),
          cusAddressCtrl.text.trim(),
          cusStateCtrl.text.trim(),
          cusPostCodeCtrl.text.trim(),
          cusCountryCtrl.text.trim(),
          cusFaxCtrl.text.trim(),
          shipNameCtrl.text.trim(),
          shipPhoneCtrl.text.trim(),
          shipCityCtrl.text.trim(),
          shipingAddressCtrl.text.trim(),
          shipStateCtrl.text.trim(),
          shipPostCodeCtrl.text.trim(),
          shipCountryCtrl.text.trim(),
          token: otpVerificationController.token);
      if (isSuccess) {
        if (mounted) {
          clearText();
          Navigator.pushNamedAndRemoveUntil(
              context, MainBottomNavScreen.name, (predicate) => false);
          showSnackbarMessage(context, 'Success');
        }
      } else {
        if (mounted) {
          showSnackbarMessage(context, completeProfileController.errorMessage!);
        }
      }
    }
  }

  void clearText() {
    cusNameCtrl.clear();
    cusmobileCtrl.clear();
    cuscityCtrl.clear();
    cusAddressCtrl.clear();
    cusStateCtrl.clear();
    cusPostCodeCtrl.clear();
    cusCountryCtrl.clear();
    cusFaxCtrl.clear();

    shipNameCtrl.clear();
    shipPhoneCtrl.clear();
    shipCityCtrl.clear();
    shipingAddressCtrl.clear();
    shipStateCtrl.clear();
    shipPostCodeCtrl.clear();
    shipCountryCtrl.clear();
  }

  @override
  void dispose() {
    cusNameCtrl.dispose();
    cusmobileCtrl.dispose();
    cuscityCtrl.dispose();
    cusAddressCtrl.dispose();
    cusStateCtrl.dispose();
    cusPostCodeCtrl.dispose();
    cusCountryCtrl.dispose();
    cusFaxCtrl.dispose();

    shipNameCtrl.dispose();
    shipPhoneCtrl.dispose();
    shipCityCtrl.dispose();
    shipingAddressCtrl.dispose();
    shipStateCtrl.dispose();
    shipPostCodeCtrl.dispose();
    shipCountryCtrl.dispose();

    super.dispose();
  }
}
