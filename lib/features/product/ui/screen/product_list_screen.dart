import 'package:crafty_bay/features/common/ui/widget/product_item_widget.dart';
import 'package:crafty_bay/features/product/ui/controllers/product_list_by_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryName, required this.categoryID});
  final String categoryName;
  final int categoryID;

  static const String name = '/product/product-list-category';

  @override 
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
   
    super.initState();
    Get.find<ProductListCategoryController>().getProductListByCategory(widget.categoryID);
  }
  @override
  Widget build(BuildContext context) {
    return  RefreshIndicator(
      onRefresh: () => Get.find<ProductListCategoryController>().getProductListByCategory(widget.categoryID),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.categoryName),
        ),
        body: GetBuilder<ProductListCategoryController>(
          builder: (controller) {
             if (controller.inProgress) {
              return const Center(child: CircularProgressIndicator(),);
             }     
            return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.8,
              crossAxisSpacing: 2,
              mainAxisSpacing: 4
              ), 
              itemCount: controller.productList.length,
            itemBuilder: (context, index){
              return  FittedBox(child: ProductItemWidget(productModel: controller.productList[index],),);
            });
          }
        ),
      ),
    );
  }
}