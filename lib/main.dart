import 'package:food_order/screens/login.dart';
import 'package:food_order/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        unselectedWidgetColor: primaryTextColor,
        scaffoldBackgroundColor: primaryBGColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: primaryBGColor,
          // brightness: Brightness.dark,
        ),
      ),
      home: LoginScreen(),
    );
  }
}
