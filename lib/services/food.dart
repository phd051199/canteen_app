import 'package:food_order/controllers/auth/login.dart';
import 'package:food_order/models/food.dart';
import 'package:food_order/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FoodServices {
  static final client = http.Client();
  static final LoginController loginController = Get.put(LoginController());
  static final headers = {'Content-type': 'application/json; charset=utf-8'};

  static Future<List<Food>> fetchFoods() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await client.get(
      Uri.parse('$apiURL/api/foods'),
      headers: {
        'Authorization': '${prefs.getString('token')}',
        'Content-type': 'application/json; charset=utf-8'
      },
    );
    if (response.statusCode == 200) {
      final jsonString = response.body;
      return foodFromJson(jsonString);
    } else {
      return [];
    }
  }

  static Future<List<Food>> fetchFoodsByCat(String catId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await client.get(
      Uri.parse('$apiURL/api/foods?catid=$catId'),
      headers: {
        'Authorization': '${prefs.getString('token')}',
        'Content-type': 'application/json; charset=utf-8'
      },
    );
    if (response.statusCode == 200) {
      final jsonString = response.body;
      return foodFromJson(jsonString);
    } else {
      return [];
    }
  }

  static Future<List<Food>> searchFoods(String foodName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await client.get(
      Uri.parse('$apiURL/api/foods?foodname=$foodName'),
      headers: {
        'Authorization': '${prefs.getString('token')}',
        'Content-type': 'application/json; charset=utf-8'
      },
    );
    if (response.statusCode == 200) {
      final jsonString = response.body;
      return foodFromJson(jsonString);
    } else {
      return [];
    }
  }
}
