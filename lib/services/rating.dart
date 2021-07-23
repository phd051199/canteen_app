import 'package:food_order/controllers/auth/login.dart';
import 'package:food_order/models/rating.dart';
import 'package:food_order/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RatingServices {
  static final client = http.Client();
  static final LoginController loginController = Get.put(LoginController());

  static Future<List<RatingModel>> fetchRating(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await client.get(
      Uri.parse('$apiURL/api/rating/$id'),
      headers: {
        'Authorization': '${prefs.getString('token')}',
        'Content-type': 'application/json; charset=utf-8'
      },
    );
    if (response.statusCode == 200) {
      final jsonString = response.body;
      return ratingModelFromJson(jsonString);
    } else {
      return [];
    }
  }
}
