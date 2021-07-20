import 'package:flutter/material.dart';
import 'package:food_order/controllers/calc_total.dart';
import 'package:food_order/controllers/cart/cart.dart';
import 'package:food_order/services/order.dart';
import 'package:food_order/utils/constants.dart';
import 'package:food_order/widgets/cart/cart.dart';
import 'package:food_order/widgets/login/button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController inputController = TextEditingController();
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
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: _.cartList.length,
                        itemBuilder: (context, index) =>
                            CartItem(cart: _.cartList[index]),
                      )
                    : Center(
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage('assets/images/no-order.png'),
                            ),
                            SizedBox(
                              height: 42,
                            ),
                            Text(
                              'Giỏ hàng rỗng',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: primaryTextColor,
                              ),
                            ),
                          ],
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
                  onPressed: _.cartList.length == 0
                      ? null
                      : () {
                          Get.dialog(
                            AlertDialog(
                              content: SizedBox(
                                height: 180,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 12,
                                    ),
                                    TextField(
                                      controller: inputController,
                                      decoration: InputDecoration(
                                        labelText: 'Bàn nhận',
                                        labelStyle: GoogleFonts.montserrat(
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: primaryTextColor,
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: primaryTextColor,
                                          ),
                                        ),
                                      ),
                                      style: GoogleFonts.montserrat(
                                        color: primaryTextColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                      cursorColor: primaryTextColor,
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    AuthButton(
                                        btnLabel: 'Đặt ngay',
                                        onPressed: () {
                                          OrderServices.order(
                                              int.parse(inputController.text),
                                              CalcController.totalCalc(
                                                  _.cartList),
                                              _.cartList);
                                        },
                                        btnColor: Colors.green,
                                        textColor: Colors.white)
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
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
