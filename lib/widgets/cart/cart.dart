import 'package:flutter/material.dart';
import 'package:food_order/controllers/cart/cart.dart';
import 'package:food_order/models/cart.dart';
import 'package:food_order/services/cart.dart';
import 'package:food_order/utils/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.cart,
  }) : super(key: key);
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 132,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          '$apiURL/uploads/${cart.food.image}',
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cart.food.name}',
                          style: GoogleFonts.montserrat(
                            color: primaryTextColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${cart.food.price} VNĐ',
                          style: GoogleFonts.montserrat(
                            color: primaryTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Số lượng: ${cart.quantity}',
                          style: GoogleFonts.montserrat(
                            color: primaryTextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () async {
                  CartServices.removeFromCart(cart.id);
                  cartController.fetchCart();
                },
                child: Icon(
                  Icons.delete_sweep_outlined,
                  color: Colors.red,
                  size: 32,
                ),
              ),
              SizedBox(
                width: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
