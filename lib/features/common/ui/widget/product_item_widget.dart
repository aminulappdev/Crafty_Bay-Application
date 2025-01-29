import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/common/data/models/productModel.dart';
import 'package:crafty_bay/features/product/ui/screen/product_datails_screen.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key, required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDatailsScreen.name, arguments: 1);
      },
      child: SizedBox(
        width: 140,
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: AppColors.themecolor.withOpacity(0.14),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      )),
                  child: Image.network(
                    productModel.image ?? '',
                    width: 140, 
                    height: 90,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                       Text(
                        productModel.title ?? '',
                        maxLines: 1,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(
                             productModel.price ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.themecolor),
                          ),
                           Wrap(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              Text(
                                 '${productModel.star ?? '0.0'}' ,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.themecolor),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.themecolor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 4,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
