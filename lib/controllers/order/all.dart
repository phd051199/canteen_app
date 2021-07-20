import 'package:food_order/models/order_list.dart';
import 'package:food_order/services/order.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<OrderListModel> orderList = List<OrderListModel>.empty().obs;

  @override
  void onInit() {
    fetchOrderList();
    super.onInit();
  }

  void fetchOrderList() async {
    try {
      isLoading(true);
      final orders = await OrderServices.fetchOrderList();
      orderList.value = orders;
    } finally {
      isLoading(false);
    }
  }
}
