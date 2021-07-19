import 'package:food_order/screens/home.dart';
import 'package:food_order/screens/login.dart';
import 'package:food_order/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String jwt = (await prefs.getString("token")) ?? '';
  runApp(FoodApp(jwt));
}

class FoodApp extends StatelessWidget {
  FoodApp(this.jwt);
  final String jwt;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: jwt == '' ? "login" : "/",
      routes: {
        '/': (context) => HomeScreen(),
        "login": (context) => LoginScreen(),
      },
      theme: ThemeData(
        unselectedWidgetColor: primaryTextColor,
        scaffoldBackgroundColor: primaryBGColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: primaryBGColor,
          // brightness: Brightness.dark,
        ),
      ),
    );
  }
}
