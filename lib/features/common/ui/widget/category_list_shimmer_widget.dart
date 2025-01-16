import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryListShimmerWidget extends StatelessWidget {
  const CategoryListShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 92.0,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < 5; i++)
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      Container(
                        height: 70,width: 70,
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        
                      ),
                      const SizedBox(height: 6,),
                      Container(
                        height: 14,width: 70,
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(4)
                        ),
                        
                      ),
                
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
