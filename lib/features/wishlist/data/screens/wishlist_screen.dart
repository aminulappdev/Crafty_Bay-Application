import 'package:crafty_bay/app/app_colors.dart';

import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/wishlist/data/widgets/wishlist_product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Get.find<MainBottomNavController>().routeHomepage();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wishlist'),
          leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavController>().routeHomepage();
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const WishlistProductItemWidget();
                  }),
            ),
            Container(
              height: 90,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.themecolor.withOpacity(0.15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Total Price',
                        style: textTheme.titleSmall,
                      ),
                      const Text(
                        '\$100262',
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
                        onPressed: () {}, child: const Text('Checkout')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
