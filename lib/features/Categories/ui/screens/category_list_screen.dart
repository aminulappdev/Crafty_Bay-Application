import 'package:crafty_bay/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/common/ui/widget/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  static const String name = '/category-list-screen';

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Get.find<MainBottomNavController>().routeHomepage();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Category List'),
          leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavController>().routeHomepage();
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<HomeCategoryListController>().getCategoryList();
          },
          child: GetBuilder<HomeCategoryListController>(builder: (controller) {
            if (controller.inProgress) {
              return const SizedBox(
                height: 200,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            return GridView.builder(
                itemCount: controller.categoryList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 16),
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: CategoryItemWidget(
                      categoryModel: controller.categoryList[index],
                    ),
                  );
                });
          }),
        ),
      ),
    );
  }
}
