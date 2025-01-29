import 'package:crafty_bay/app/asset_path.dart';
import 'package:crafty_bay/features/common/data/models/productModel.dart';
import 'package:crafty_bay/features/common/ui/widget/category_list_shimmer_widget.dart';
import 'package:crafty_bay/features/common/ui/widget/product_item_shimmer_effect_widget.dart';
import 'package:crafty_bay/features/home/ui/controllers/new_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/populer_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/widgets/carousel_simmer_widget.dart';
import 'package:crafty_bay/features/common/data/models/category_model.dart';
import 'package:crafty_bay/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/banner_list_controller.dart';
import 'package:crafty_bay/features/home/ui/widgets/app_bar_icon_button.dart';
import 'package:crafty_bay/features/common/ui/widget/category_item_widget.dart';
import 'package:crafty_bay/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:crafty_bay/features/home/ui/widgets/home_section_header.dart';
import 'package:crafty_bay/features/common/ui/widget/product_item_widget.dart';
import 'package:crafty_bay/features/home/ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController productSerachCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              ProductSearchBar(textEditingController: productSerachCtrl),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<HomeBannerListController>(builder: (controller) {
                if (controller.inProgress) {
                  return const CarouselSimmerWidget();
                }
                return HomeCarouselSlider(
                  bannerList: controller.bannerList,
                );
              }),
              HomeSectionHeader(
                title: 'Category',
                ontap: () {
                  Get.find<MainBottomNavController>().routeCategorypage();
                },
              ),
              const SizedBox(
                height: 8,
              ),
              GetBuilder<HomeCategoryListController>(builder: (controller) {
                if (controller.inProgress) {
                  return const CategoryListShimmerWidget();
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getCategoryList(controller.categoryList),
                  ),
                );
              }),
              const SizedBox(
                height: 8,
              ),
              HomeSectionHeader(
                title: 'Populer',
                ontap: () {},
              ),
              GetBuilder<PopulerProductListController>(builder: (controller) {            
                if (controller.inProgress) {
                  return const ProductItemShimmerEffectWidget();
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getProductList(controller.productList),
                  ),
                );
              }),
              const SizedBox(
                height: 8,
              ),
              HomeSectionHeader(
                title: 'Spacial',
                ontap: () {},
              ),
              GetBuilder<PopulerProductListController>(
                builder: (controller) {
                   if (controller.inProgress) {
                  return const ProductItemShimmerEffectWidget();
                }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _getProductList(controller.productList),
                    ),
                  );
                }
              ),
              const SizedBox(
                height: 8,
              ),
              HomeSectionHeader(
                title: 'New',
                ontap: () {},
              ),
              GetBuilder<NewProductListController>(
                builder: (controller) {
                   if (controller.inProgress) {
                  return const ProductItemShimmerEffectWidget();
                }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _getProductList(controller.productList),
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getCategoryList(List<CategoryModel> categoryModels) {
    List<Widget> categoryList = [];
    for (var i = 0; i < categoryModels.length; i++) {
      categoryList.add(Padding(
        padding: const EdgeInsets.only(right: 8),
        child: CategoryItemWidget(
          categoryModel: categoryModels[i],
        ),
      ));
    }
    return categoryList;
  }

  List<Widget> _getProductList(List<ProductModel> productList) {
    List<Widget> list = [];
    for (var i = 0; i < productList.length; i++) {
      list.add(Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ProductItemWidget(
          productModel: productList[i],
        ),
      ));
    }
    return list;
  }

  AppBar buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssestPath.navApplogoSvg),
      actions: [
        AppBarIconButtom(
          icon: Icons.person_2_outlined,
          ontap: () {},
        ),
        const SizedBox(
          width: 6,
        ),
        AppBarIconButtom(
          icon: Icons.call,
          ontap: () {},
        ),
        const SizedBox(
          width: 6,
        ),
        AppBarIconButtom(
          icon: Icons.notification_important_outlined,
          ontap: () {},
        )
      ],
    );
  }
}
