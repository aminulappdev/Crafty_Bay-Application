
import 'package:crafty_bay/app/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key, required this.height, required this.width, required this.boxFit,
  });

  final double? height;
  final double? width ;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(

      AssestPath.applogoSvg,
      height: height ?? 120,
      width: width ?? 120,
      fit: boxFit?? BoxFit.scaleDown,
    );
  }
}