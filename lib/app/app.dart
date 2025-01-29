import 'package:crafty_bay/app/app_theme_data.dart';
import 'package:crafty_bay/app/controller_binder.dart';
import 'package:crafty_bay/features/Categories/ui/screens/category_list_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/email_varification_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/otp_varification_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/splash_screen.dart';
import 'package:crafty_bay/features/common/ui/screen/main_bottom_nav_screen.dart';
import 'package:crafty_bay/features/product/ui/screen/product_datails_screen.dart';
import 'package:crafty_bay/features/product/ui/screen/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;

        if (settings.name == SplashScreen.name) {
          widget = const SplashScreen();
        } else if (settings.name == EmailVarificationScreen.name) {
          widget = const EmailVarificationScreen();
        } else if (settings.name == OtpVarificationScreen.name) {
          String email = settings.arguments as String;
          widget = OtpVarificationScreen(email: email);
        } else if (settings.name == CompleteProfileScreen.name) {
          widget = const CompleteProfileScreen();
        } else if (settings.name == MainBottomNavScreen.name) {
          widget = const MainBottomNavScreen();
        } else if (settings.name == CategoryListScreen.name) {
          widget = const CategoryListScreen();
        } else if (settings.name == ProductListScreen.name) {
          Map<String, dynamic> args =
              settings.arguments as Map<String, dynamic>;
          widget = ProductListScreen(
            categoryName: args['categoryName'],
            categoryID: args['categoryID'],
          );
        } else if (settings.name == ProductDatailsScreen.name) {
          int productId = settings.arguments as int;
          widget = ProductDatailsScreen(
            prodcutId: productId,
          );
        }

        return MaterialPageRoute(
          builder: (contex) {
            return widget;
          },
        );
      },
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      initialBinding: ControllerBinder(),
    );
  }
}
