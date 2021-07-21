import 'package:food_order/screens/home.dart';
import 'package:food_order/screens/login.dart';
import 'package:food_order/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = (await prefs.getString('token')) ?? '';
  runApp(FoodApp(token));
}

class FoodApp extends StatelessWidget {
  FoodApp(this.token);
  final String token;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: token == '' ? 'login' : '/',
      routes: {
        '/': (context) => HomeScreen(),
        'login': (context) => LoginScreen(),
      },
      theme: ThemeData(
        unselectedWidgetColor: primaryTextColor,
        scaffoldBackgroundColor: primaryBGColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: primaryBGColor,
        ),
      ),
    );
  }
}
