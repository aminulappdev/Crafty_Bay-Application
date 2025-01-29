import 'package:crafty_bay/features/Categories/ui/screens/category_list_screen.dart';
import 'package:crafty_bay/features/cart/ui/screens/cart_screen.dart';
import 'package:crafty_bay/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/banner_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/new_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/populer_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/special_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/screens/home_screen.dart';
import 'package:crafty_bay/features/wishlist/data/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const String name = '/main-navbar-screen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final MainBottomNavController bottomNavController =
      Get.find<MainBottomNavController>();
  final HomeBannerListController homeBannerListController =
      Get.find<HomeBannerListController>();
  final HomeCategoryListController homeCategoryListController =
      Get.find<HomeCategoryListController>();

  final List<Widget> screens = [
    const HomeScreen(),
    const CategoryListScreen(),
    const CartScreen(),
    const WishlistScreen(),

  ];

  @override
  void initState() {
    homeBannerListController.getBannerList();
    Get.find<HomeCategoryListController>().getCategoryList();
    Get.find<PopulerProductListController>().getProductList();
    Get.find<NewProductListController>().getProductList();
    Get.find<SpecialProductListController>().getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(builder: (bottomNavController) {
      return Scaffold(
        body: screens[bottomNavController.selectIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: bottomNavController.selectIndex,
          onDestinationSelected:
              bottomNavController.changeIndex, // change index value
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.category), label: 'Category'),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart), label: 'Shopping'),
            NavigationDestination(
                icon: Icon(Icons.favorite_border), label: 'Wishlist')
          ],
        ),
      );
    });
  }
}
