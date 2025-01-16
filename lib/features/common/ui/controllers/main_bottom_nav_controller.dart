import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  int _selectIndex = 0; 

  int get selectIndex => _selectIndex;

  void changeIndex(int index) {
    if (index == _selectIndex) {
      return;
    }

    _selectIndex = index;
    update();
  }

  void routeCategorypage ()
  {
    changeIndex(1);
  }

   void routeHomepage ()
  {
    changeIndex(0);
  }
}
