import 'package:crafty_bay/Services/network_caller/network_caller.dart';
import 'package:crafty_bay/Services/network_caller/network_response.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/features/auth/data/models/auth_success_model.dart';
import 'package:crafty_bay/features/common/data/controllers/auth_controller.dart';
import 'package:get/get.dart';

class OTPVerificationController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  Future<bool> verifyOTP(String email, String otp) async {
    bool isSuccess = false;

    _inProgress = true;

    update();

    final Map<String, dynamic> requestParams = {"email": email, "otp": otp};

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(Urls.otpVerify, requestParams);

    if (response.isSuccess) {
      AuthSuccessModel authSuccessModel = AuthSuccessModel.fromJson(response.responseData);
      await AuthController.saveUserData(
          authSuccessModel.data!.token!, authSuccessModel.data!.user!);
      _errorMessage = null;

      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
