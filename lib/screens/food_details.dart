import 'package:food_order/models/food.dart';
import 'package:flutter/material.dart';
import 'package:food_order/utils/constants.dart';
import 'package:food_order/widgets/login/button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetails extends StatelessWidget {
  FoodDetails({
    required this.food,
  });
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: primaryTextColor,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        title: Text(
          'Back',
          style: GoogleFonts.montserrat(
            color: primaryTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              child: Text(
                food.name,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: primaryTextColor,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  food.image,
                  width: Get.width * 0.88,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: AuthButton(
          btnLabel: 'Thêm vào giỏ hàng',
          onPressed: () {},
          btnColor: secondaryBGColor,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
