class Urls {
  static const String baseUrl = 'https://ecommerce-api.codesilicon.com/api';
  static  String emailVerify(String email) {
    return '$baseUrl/UserLogin/$email';
  }

  static  String otpVerify(String email, String otp) {
    return '$baseUrl/VerifyLogin/$email/$otp';
  }

  static String readProfile = '$baseUrl/ReadProfile';
  static String createProfile = '$baseUrl/CreateProfile';
  static String listProductSlider = '$baseUrl/ListProductSlider';
  static String categoryList = '$baseUrl/CategoryList';

  static  String productListByRemark(String remark) {
    return '$baseUrl/ListProductByRemark/$remark';
  }
}


