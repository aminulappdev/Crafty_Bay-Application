import 'package:crafty_bay/Services/network_caller/network_caller.dart';
import 'package:crafty_bay/features/auth/ui/controller/complete_profile_controller.dart';
import 'package:crafty_bay/features/auth/ui/controller/email_verification_controller.dart';
import 'package:crafty_bay/features/auth/ui/controller/otp_verification_controller.dart';
import 'package:crafty_bay/features/auth/ui/controller/read_profile_controller.dart';
import 'package:crafty_bay/features/common/data/controllers/auth_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/banner_list_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(NetworkCaller());
    Get.put(EmailVerificationController());
    Get.put(OTPVerificationController());
    Get.put(ReadProfileController());
    Get.put(AuthController());
    Get.put(CompleteProfileController());
    Get.put(HomeBannerListController());
    Get.put(HomeCategoryListController());

  }
 
}