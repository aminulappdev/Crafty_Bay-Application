import 'package:crafty_bay/Services/network_caller/network_caller.dart';
import 'package:crafty_bay/Services/network_caller/network_response.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/features/home/data/models/banner_list_model.dart';
import 'package:crafty_bay/features/home/data/models/banner_model.dart';
import 'package:get/get.dart';

class HomeBannerListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  BannerListModel? _bannerListModel;

  List<BannerModel> get bannerList => _bannerListModel?.bannerList ?? [];

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> getBannerList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.listProductSlider);
    if (response.isSuccess) {
      _bannerListModel = BannerListModel.fromJson(response.responseData) ;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}





