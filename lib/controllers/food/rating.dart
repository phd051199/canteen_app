import 'package:food_order/models/rating.dart';
import 'package:food_order/services/rating.dart';
import 'package:get/get.dart';

class FoodRatingtController extends GetxController {
  FoodRatingtController({required this.id});
  RxBool isLoading = true.obs;
  RxList<RatingModel> rateList = List<RatingModel>.empty().obs;
  String id = '';

  @override
  void onInit() {
    fetchRate(id);
    super.onInit();
  }

  void fetchRate(String id) async {
    try {
      isLoading(true);
      final rating = await RatingServices.fetchRating(id);
      rateList.value = rating;
    } finally {
      isLoading(false);
    }
  }
}
