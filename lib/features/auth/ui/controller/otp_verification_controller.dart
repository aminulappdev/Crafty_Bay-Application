import 'package:crafty_bay/Services/network_caller/network_caller.dart';
import 'package:crafty_bay/Services/network_caller/network_response.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/features/auth/ui/controller/read_profile_controller.dart';
import 'package:crafty_bay/features/common/data/controllers/auth_controller.dart';
import 'package:get/get.dart';

class OTPVerificationController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool? _shouldNavigateCompleteProfile = false;
  bool? get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

  String? _token;
  String? get token => _token;

  Future<bool> verifyOTP(String email, String otp) async {
    bool isSuccess = false;

    _inProgress = true;

    update();

    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.otpVerify(email, otp));

    if (response.isSuccess) {
      _errorMessage = null;

      String token = response.responseData['data'];
      await Get.find<ReadProfileController>().readProfileData(token);

      if (Get.find<ReadProfileController>().profileModel == null) {
        _token = response.responseData['data'];
        _shouldNavigateCompleteProfile = true;
      } else {
        await AuthController.saveUserData(
            token, Get.find<ReadProfileController>().profileModel!);
        _shouldNavigateCompleteProfile = false;
      }

      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
