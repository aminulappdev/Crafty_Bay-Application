
import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/common/ui/widget/product_quantity_inc_dec_button.dart';
import 'package:flutter/material.dart';

class WishlistProductItemWidget extends StatelessWidget {
  const WishlistProductItemWidget({
    super.key,
    
  });

  

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        child: Row(
          children: [
            Image.asset(
              'assest/Images/shoes.png',
              width: 90,
              height: 90,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nick shoe wishlist - New Addition ',
                              style: textTheme.bodyLarge
                                  ?.copyWith(overflow: TextOverflow.ellipsis),
                              maxLines: 1,
                            ),
                            const Row(
                              children: [
                                Text("Color : white"),
                                SizedBox(
                                  width: 4,
                                ),
                                Text("Size : XL"),
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '\$100',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.themecolor),
                      ),
                      ProductQuantityIncreamentDecrementButton(
                        onchange: (int c) {},
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
