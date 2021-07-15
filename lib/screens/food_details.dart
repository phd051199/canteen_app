import 'package:food_order/controllers/cart/cart.dart';
import 'package:food_order/models/food.dart';
import 'package:flutter/material.dart';
import 'package:food_order/screens/home.dart';
import 'package:food_order/utils/constants.dart';
import 'package:food_order/widgets/login/button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetails extends StatefulWidget {
  FoodDetails({
    required this.food,
  });
  final Food food;

  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: secondaryBGColor,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: secondaryBGColor,
            ),
            onPressed: () => Get.to(() => HomeScreen()),
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
                widget.food.name,
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
                  widget.food.image,
                  width: Get.width * 0.88,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 24),
              child: Text(
                'Giá: ${widget.food.price} VNĐ',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: primaryTextColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 24),
              child: Row(
                children: [
                  SizedBox(
                    width: 42,
                    height: 42,
                    child: ElevatedButton(
                      onPressed: _counter > 0 ? _decrementCounter : null,
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Color(0xffFFdee2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        '-',
                        style: GoogleFonts.montserrat(
                          color: _counter > 0 ? Colors.red : Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 42,
                    height: 42,
                    child: Center(
                      child: Text(
                        '$_counter',
                        style: GoogleFonts.montserrat(
                          color: primaryTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 42,
                    height: 42,
                    child: ElevatedButton(
                      onPressed: _incrementCounter,
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Color(0xffFFdee2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        '+',
                        style: GoogleFonts.montserrat(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 24, bottom: 16),
              child: Text(
                'Mô tả chi tiết',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: primaryTextColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                widget.food.detail,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: primaryTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 32),
        child: AuthButton(
          btnLabel: 'Thêm vào giỏ hàng',
          onPressed: () {
            cartController.addOrder(widget.food, _counter);
            print(cartController.orderList);
          },
          btnColor: secondaryBGColor,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
