import 'package:get/get.dart';

class CalcController extends GetxController {
  static int totalCalc(cartList) {
    int total = 0;
    for (var item in cartList) {
      int quantity = item.quantity;
      total += int.parse(item.food.price) * quantity;
    }
    return total;
  }
}
