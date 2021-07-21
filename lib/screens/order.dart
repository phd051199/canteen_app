import 'package:flutter/material.dart';
import 'package:food_order/controllers/order/all.dart';
import 'package:food_order/models/order_list.dart';
import 'package:food_order/utils/constants.dart';
import 'package:food_order/widgets/login/button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<OrderController>(
      init: OrderController(),
      builder: (_) => _.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(secondaryBGColor),
              ),
            )
          : Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _.orderList.length,
                itemBuilder: (context, index) =>
                    OrderListItem(order: _.orderList[index]),
              ),
            ),
    );
  }
}

class OrderListItem extends StatelessWidget {
  const OrderListItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderListModel order;
  @override
  Widget build(BuildContext context) {
    final _url = '$apiURL/api/vnp/checkout/${order.id}';
    void _launchURL() async => await canLaunch(_url)
        ? await launch(_url)
        : throw 'Could not launch $_url';
    return GestureDetector(
      onTap: () {
        Get.dialog(
          AlertDialog(
            content: SizedBox(
              width: Get.width,
              height: Get.height * 0.3,
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Thông tin chi tiết đơn hàng',
                    style: GoogleFonts.montserrat(
                      color: primaryTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  AuthButton(
                    btnLabel: 'Thanh toán ngay',
                    onPressed: _launchURL,
                    btnColor: Colors.green,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(16),
        height: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Mã đơn hàng',
                          style: GoogleFonts.montserrat(
                            color: primaryTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 8),
                    Text(
                      '${order.id}',
                      style: GoogleFonts.montserrat(
                        color: Color(0xff48B6DB),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Bàn số',
                  style: GoogleFonts.montserrat(
                    color: primaryTextColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    '${order.tableId}',
                    style: GoogleFonts.montserrat(
                      color: Colors.purple,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Trạng thái đơn hàng',
                  style: GoogleFonts.montserrat(
                    color: primaryTextColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: order.status == 0
                        ? Colors.lightBlueAccent.withOpacity(0.1)
                        : order.status == 1
                            ? Colors.orangeAccent.withOpacity(0.1)
                            : order.status == 2
                                ? Colors.greenAccent.withOpacity(0.1)
                                : Colors.redAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    order.status == 0
                        ? 'Đang xử lý'
                        : order.status == 1
                            ? 'Đã thanh toán'
                            : order.status == 2
                                ? 'Thành công'
                                : 'Đã huỷ',
                    style: GoogleFonts.montserrat(
                      color: order.status == 0
                          ? Colors.blue
                          : order.status == 1
                              ? Colors.orange
                              : order.status == 2
                                  ? Colors.green
                                  : Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Tổng đơn hàng',
                  style: GoogleFonts.montserrat(
                    color: primaryTextColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '${order.total} VNĐ',
                  style: GoogleFonts.montserrat(
                    color: primaryTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
