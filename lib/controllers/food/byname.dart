import 'package:food_order/models/food.dart';
import 'package:food_order/services/food.dart';
import 'package:get/get.dart';

class FoodByNameController extends GetxController {
  FoodByNameController({required this.foodName});
  RxBool isLoading = true.obs;
  RxList<Food> foodList = List<Food>.empty().obs;
  String foodName = '';

  @override
  void onInit() {
    fetchFoods(foodName);
    super.onInit();
  }

  void fetchFoods(String foodName) async {
    try {
      isLoading(true);
      final foods = await FoodServices.searchFoods(foodName);
      foodList.value = foods;
    } finally {
      isLoading(false);
    }
  }
}
