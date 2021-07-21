import 'package:food_order/models/food.dart';
import 'package:food_order/services/food.dart';
import 'package:get/get.dart';

class PopularFoodController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Food> foodList = List<Food>.empty().obs;

  @override
  void onInit() {
    fetchFoods();
    super.onInit();
  }

  void fetchFoods() async {
    try {
      isLoading(true);
      final foods = await FoodServices.fetchFoodsByCat('1');
      foodList.value = foods;
    } finally {
      isLoading(false);
    }
  }
}
