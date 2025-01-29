import 'package:crafty_bay/Services/network_caller/network_caller.dart';
import 'package:crafty_bay/Services/network_caller/network_response.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/features/product/data/models/product_datails_model.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  ProductDatailsModel? _productDatailsModel;

  ProductDetails? get productDetails => _productDatailsModel?.data!.first;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> getProductDetails(int prodcutId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.productDetailsByID(prodcutId));
    if (response.isSuccess) {
      _productDatailsModel = ProductDatailsModel.fromJson(response.responseData) ;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}





