import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/product/data/models/product_datails_model.dart';
import 'package:crafty_bay/features/product/ui/controllers/product_details_controller.dart';
import 'package:crafty_bay/features/product/ui/screen/product_image_carousel_slider.dart';
import 'package:crafty_bay/features/product/ui/widget/color_picker_widget.dart';
import 'package:crafty_bay/features/common/ui/widget/product_quantity_inc_dec_button.dart';
import 'package:crafty_bay/features/product/ui/widget/size_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductDatailsScreen extends StatefulWidget {
  const ProductDatailsScreen({super.key, required this.prodcutId});
  final int prodcutId;
  static const String name = '/prodcut/product-datails-screen';

  @override
  State<ProductDatailsScreen> createState() => _ProductDatailsScreenState();
}

class _ProductDatailsScreenState extends State<ProductDatailsScreen> {

  @override
  void initState() {
   
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.prodcutId);
  }
  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product datails'),
      ),
      body: GetBuilder<ProductDetailsController>(
        builder: (controller) {
          if(controller.inProgress)
          {
            return const Center(child: CircularProgressIndicator(),);
          }
          if(controller.errorMessage!= null){
            return Center(child: Text(controller.errorMessage!),);
          }
          ProductDetails productDetails = controller.productDetails!;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       ProductImageCarouselSlider(imagesUrls: [
                        productDetails.img1!,
                        productDetails.img2!,
                        productDetails.img3!,
                        productDetails.img4!,
                      ],),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Text(
                                        textAlign: TextAlign.start,
                                        productDetails.product?.title ?? '',
                                        style: textTheme.titleMedium,
                                      ),
                                      Row(
                                        children: [
                                           Wrap(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 18,
                                              ),
                                              Text(
                                                '${productDetails.product?.star ?? ''}',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.themecolor),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              print('Revie page');
                                            },
                                            child: const Text('Review',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.themecolor),)),
                                          // TextButton(
                                          //     onPressed: () {},
                                          //     child: const Text('Review')),
                                          const SizedBox(
                                            width: 8,
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
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                ProductQuantityIncreamentDecrementButton(
                                  onchange: (int value) {},
                                ),
                              ],
                            ),
                             Text('Colors', style: textTheme.titleMedium,),
                            ColorPickerWidget(
                              colors: productDetails.color?.split(',') ?? [],
                              onColorSelected: (String color) {},
                            ),
                            const SizedBox(height: 8,),
                             Text('Colors', style: textTheme.titleMedium,),
                            SizePickerWidget(
                              sizes: productDetails.size?.split(',') ?? [],
                              onSizeSelected: (String color) {},
                            ),
                             const SizedBox(height: 16,),
                               Text('Description', style: textTheme.titleMedium,),
                              const SizedBox(height: 4,),
                               Text(productDetails.des ?? '',
                              
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                                
                              ),
                              textAlign: TextAlign.justify,
                              ),
                              
                          ],
                        ),
                      ),
                    ],
                  ),
                ), 
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.themecolor.withOpacity(0.15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Column(
                      children: [
                         Text('Price', style: textTheme.titleSmall,),
                         Text(
                          productDetails.product?.price ?? '',
                          style: const TextStyle(
                              color: AppColors.themecolor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text('Add to Cart')),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
