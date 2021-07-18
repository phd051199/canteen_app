import 'package:flutter/material.dart';
import 'package:food_order/controllers/calc_total.dart';
import 'package:food_order/controllers/cart/cart.dart';
import 'package:food_order/services/cart.dart';
import 'package:food_order/utils/constants.dart';
import 'package:food_order/widgets/cart/cart.dart';
import 'package:food_order/widgets/login/button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CartController>(
      init: CartController(),
      builder: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: Get.height * 0.67,
            child: _.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(secondaryBGColor),
                    ),
                  )
                : _.cartList.length != 0
                    ? RefreshIndicator(
                        color: secondaryBGColor,
                        onRefresh: () async {
                          await Future.delayed(Duration(milliseconds: 800));
                          CartServices.fetchCart();
                        },
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: _.cartList.length,
                          itemBuilder: (context, index) =>
                              CartItem(cart: _.cartList[index]),
                        ),
                      )
                    : Center(
                        child: Text(
                          'Giỏ hàng rỗng',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: primaryTextColor,
                          ),
                        ),
                      ),
          ),
          Container(
            margin: new EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tổng cộng: ${CalcController.totalCalc(_.cartList)} VNĐ',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: primaryTextColor,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                AuthButton(
                  btnLabel: 'Tiến hành đặt hàng',
                  onPressed: _.cartList.length == 0 ? null : () {},
                  btnColor: secondaryBGColor,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
