
import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/common/data/models/category_model.dart';
import 'package:crafty_bay/features/product/ui/screen/product_list_screen.dart';
import 'package:flutter/material.dart';


class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key, required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductListScreen.name, arguments: 'Computer');
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.themecolor.withOpacity(0.14),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(categoryModel.categoryImg?? '', width: 40,height: 40,fit: BoxFit.scaleDown,)
          ),
          const SizedBox(height: 8,),
           Text(categoryModel.categoryName ?? '',style: const TextStyle(
            fontSize: 12,
            color: AppColors.themecolor,
            fontWeight: FontWeight.w500,
          
          ),)
        ],
      ),
    );
  }
}