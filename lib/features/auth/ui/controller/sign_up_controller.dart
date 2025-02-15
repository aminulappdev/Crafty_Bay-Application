import 'package:crafty_bay/Services/network_caller/network_caller.dart';
import 'package:crafty_bay/Services/network_caller/network_response.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/features/auth/data/models/profile_model.dart';
import 'package:crafty_bay/features/auth/data/models/sign_up_params.dart';

import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool isSuccess = false;
  bool _inProgress = false;
  bool get inprogress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  ProfileModel? _profileModel;
  ProfileModel? get profileModel => _profileModel;

  Future<bool> signUp(SignUpParams params) async {
    _inProgress = true;
    update();

    
    final NetworkResponse response =
        await Get.find<NetworkCaller>().postRequest(
      Urls.signUpUrl,
      params.toJson(),
    );

    if (response.isSuccess) {
      // _profileModel = ProfileModel.fromJson(response.responseData['data']);
      // AuthController.saveUserData(token!, _profileModel!);
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
