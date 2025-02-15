import 'package:crafty_bay/Services/network_caller/network_caller.dart';
import 'package:crafty_bay/Services/network_caller/network_response.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/features/auth/data/models/sign_in_model.dart';
import 'package:crafty_bay/features/auth/ui/controller/read_profile_controller.dart';
import 'package:crafty_bay/features/common/data/controllers/auth_controller.dart';
import 'package:get/get.dart';

class SignINController extends GetxController {
  
  bool _inProgress = false;
  bool get inProgress => _inProgress;
 
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> signIn(String email,String password) async {
    bool isSuccess = false;

    _inProgress = true;
     
    update();

    final requestParam = {
          
    "email":email,
    "password":password

    };

    final NetworkResponse response =
        await Get.find<NetworkCaller>().postRequest(Urls.signInUrl,requestParam );

    if (response.isSuccess) {

      SignInModel signInModel = SignInModel.fromJson(response.responseData);
      await AuthController.saveUserData(
            signInModel.data!.token!, signInModel.data!.user!);
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
