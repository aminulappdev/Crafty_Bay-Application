import 'package:crafty_bay/Services/network_caller/network_caller.dart';
import 'package:crafty_bay/Services/network_caller/network_response.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/features/auth/data/models/profile_model.dart';
import 'package:crafty_bay/features/common/data/controllers/auth_controller.dart';

import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  bool isSuccess = false;
  bool _inProgress = false;
  bool get inprogress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  ProfileModel? _profileModel;
  ProfileModel? get profileModel => _profileModel;

  Future<bool> completeProfile(
    String cusName, 
    String cusPhone, 
    String cusCity,
    String cusAddress, 
    String cusState,
    String cusPostCode,
    String cusCountry,
    String cusFax,

    String shipName, 
    String shipPhone, 
    String shipCity,
    String shipAddress, 
    String shipState,
    String shipPostCode,
    String shipCountry,
    
      
    {String? token}) async {
    _inProgress = true;
    update();

    Map<String, dynamic> requestBody = {
      "cus_name": cusName,
      "cus_phone": cusPhone,
      "cus_city": cusCity,
      "cus_add": cusAddress,
      "cus_state": cusState,
      "cus_postcode": cusPostCode,
      "cus_country": cusCountry,
      "cus_fax": cusFax,

      "ship_name": shipName,
      "ship_add": shipAddress,
      "ship_city": shipCity,
      "ship_state": shipState,
      "ship_postcode": shipPostCode,
      "ship_country": shipCountry,
      "ship_phone": shipPhone
    };

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(Urls.createProfile, requestBody, accesToken: token);

    if (response.isSuccess) {
      _profileModel = ProfileModel.fromJson(response.responseData['data']);
      AuthController.saveUserData(token!, _profileModel!);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();

    return isSuccess;
  }
}
