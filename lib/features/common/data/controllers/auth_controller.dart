import 'dart:convert';
import 'package:crafty_bay/features/auth/data/models/sign_in_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static const String _accesTokenKey = 'acces-token';
  static const String _profileDataKey = 'acces-token';

  static String? accesToken;
  static User? profileModel;

  static Future<void> saveUserData(
      String accesToken, User userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accesTokenKey, accesToken);
    await sharedPreferences.setString(
        _profileDataKey, jsonEncode(userModel.toString()));

        profileModel = userModel;
  }

  static Future<void> getUsetData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    accesToken = sharedPreferences.getString(_accesTokenKey);
    profileModel = User.fromJson(
        jsonDecode(sharedPreferences.getString(_profileDataKey)!));
  }

  static Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString(_accesTokenKey);
    if (token != null) {
      await getUsetData();
      return true;
    }
    return false;
  }

  static Future<void> clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
