class Urls {
  static const String baseUrl = 'https://ecom-rs8e.onrender.com/api';

  static String signInUrl = '$baseUrl/auth/login';
  static String signUpUrl = '$baseUrl/auth/signup';
  

  static String otpVerify(String email, String otp) {
    return '$baseUrl/VerifyLogin/$email/$otp';
  }

  static String readProfile = '$baseUrl/ReadProfile';
  static String createProfile = '$baseUrl/CreateProfile';
  static String listProductSlider = '$baseUrl/ListProductSlider';
  static String categoryList = '$baseUrl/CategoryList';
  

  static String productListByRemark(String remark) {
    return '$baseUrl/ListProductByRemark/$remark';
  }

  static String productListByCategory(int categotyID) {
    return '$baseUrl/ListProductByCategory/$categotyID';
  }

  static String productDetailsByID(int productID) {
    return '$baseUrl/ProductDetailsById/$productID';
  }
}
