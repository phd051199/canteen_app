import 'package:food_order/models/category.dart';
import 'package:food_order/services/cat.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Category> catList = List<Category>.empty().obs;

  @override
  void onInit() {
    fetchCats();
    super.onInit();
  }

  void fetchCats() async {
    try {
      isLoading(true);
      final cats = await CategoryServices.fetchCats();
      catList.value = cats;
    } finally {
      isLoading(false);
    }
  }
}
