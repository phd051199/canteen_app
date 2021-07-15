import 'package:get/get.dart';

class CartController extends GetxController {
  RxList orderList = List.empty().obs;
  void addOrder(item, count) {
    orderList.add({
      'id': item.id,
      'name': item.name,
      'price': item.price,
      'count': count,
    });
  }
}
