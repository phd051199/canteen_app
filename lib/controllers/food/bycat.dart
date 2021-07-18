import 'package:food_order/models/food.dart';
import 'package:food_order/services/food.dart';
import 'package:get/get.dart';

class FoodByCatController extends GetxController {
  FoodByCatController({required this.cat});
  RxBool isLoading = true.obs;
  RxList<Food> foodList = List<Food>.empty().obs;
  String cat = '';

  @override
  void onInit() {
    fetchFoods(cat);
    super.onInit();
  }

  void fetchFoods(String id) async {
    try {
      isLoading(true);
      final foods = await FoodServices.fetchFoodsByCat(id);
      foodList.value = foods;
    } finally {
      isLoading(false);
    }
  }
}
