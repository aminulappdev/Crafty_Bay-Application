import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/product/ui/screen/product_image_carousel_slider.dart';
import 'package:crafty_bay/features/product/ui/widget/color_picker_widget.dart';
import 'package:crafty_bay/features/common/ui/widget/product_quantity_inc_dec_button.dart';
import 'package:crafty_bay/features/product/ui/widget/size_picker_widget.dart';
import 'package:flutter/material.dart';


class ProductDatailsScreen extends StatefulWidget {
  const ProductDatailsScreen({super.key, required this.prodcutId});
  final int prodcutId;
  static const String name = '/prodcut/product-datails-screen';

  @override
  State<ProductDatailsScreen> createState() => _ProductDatailsScreenState();
}

class _ProductDatailsScreenState extends State<ProductDatailsScreen> {

  
  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product datails'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ProductImageCarouselSlider(),
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
                                    'This is new shoe - New year addition',
                                    style: textTheme.titleMedium,
                                  ),
                                  Row(
                                    children: [
                                      const Wrap(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 18,
                                          ),
                                          Text(
                                            '4.5',
                                            style: TextStyle(
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
                          colors: const ['red', 'yellow', 'green', 'blue'],
                          onColorSelected: (String color) {},
                        ),
                        const SizedBox(height: 8,),
                         Text('Colors', style: textTheme.titleMedium,),
                        SizePickerWidget(
                          sizes: const ['M', 'L', 'XL', 'XXL'],
                          onSizeSelected: (String color) {},
                        ),
                         const SizedBox(height: 16,),
                           Text('Description', style: textTheme.titleMedium,),
                          const SizedBox(height: 4,),
                          const Text('''It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. ''',
                          style: TextStyle(
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
                    const Text(
                      '\$100',
                      style: TextStyle(
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
      ),
    );
  }
}
