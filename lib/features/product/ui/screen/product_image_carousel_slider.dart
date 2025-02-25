import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCarouselSlider extends StatefulWidget {
  const ProductImageCarouselSlider({
    super.key, required this.imagesUrls,
  });

 final List<String> imagesUrls;

  @override
  State<ProductImageCarouselSlider> createState() => _ProductImageCarouselSliderState();
}

class _ProductImageCarouselSliderState extends State<ProductImageCarouselSlider> {

  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 220.0, viewportFraction: 0.95, onPageChanged: (currentIndex, reason) {
            _selectedIndex.value = currentIndex;
          },),
          items: widget.imagesUrls.map(
            (i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 0),
                      decoration:  BoxDecoration(
                        image: DecorationImage(image: NetworkImage(i),fit: BoxFit.fill),
                          color: const Color.fromARGB(255, 184, 196, 196),
                       ),
                      );
                },
              );
            },
          ).toList(),
        ),
        const SizedBox(height: 8,),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: ValueListenableBuilder( valueListenable: _selectedIndex, 
          builder: (context, value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i = 0; i<widget.imagesUrls.length; i++) 
                Container(
                  width: 16,
                  height: 16,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: value == i ? AppColors.themecolor : Colors.transparent,
                    border: Border.all(color: Colors.white)
                  ),
                ),
              ],
            );
          },
          ),
        )
      ],
    );
  }
}
