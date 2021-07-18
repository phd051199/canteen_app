import 'package:food_order/models/cart.dart';
import 'package:food_order/services/cart.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Cart> cartList = List<Cart>.empty().obs;

  @override
  void onInit() {
    fetchCart();
    super.onInit();
  }

  void fetchCart() async {
    try {
      isLoading(true);
      final cats = await CartServices.fetchCart();
      cartList.value = cats;
    } finally {
      isLoading(false);
    }
  }
}
