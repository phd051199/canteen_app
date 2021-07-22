import 'package:food_order/models/food.dart';
import 'package:flutter/material.dart';
import 'package:food_order/services/cart.dart';
import 'package:food_order/utils/constants.dart';
import 'package:food_order/widgets/login/button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

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
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: secondaryBGColor,
        ),
        centerTitle: false,
        title: Text(
          widget.food.name,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: primaryTextColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  '$apiURL/uploads/${widget.food.image}',
                  width: Get.width * 0.88,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 24),
              child: Text(
                'Giá : ${widget.food.price} VNĐ',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: primaryTextColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 24),
              child: Row(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 42,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: _counter > 0 ? _decrementCounter : null,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shadowColor: Colors.transparent,
                            primary: Color(0xffB1EAFD).withOpacity(0.6),
                          ),
                          child: Text(
                            '-',
                            style: GoogleFonts.montserrat(
                              color: _counter > 0
                                  ? Color(0xff48B6DB)
                                  : Colors.grey,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 42,
                        height: 42,
                        color: Color(0xffB1EAFD).withOpacity(0.15),
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
                            shadowColor: Colors.transparent,
                            primary: Color(0xffB1EAFD).withOpacity(0.6),
                          ),
                          child: Text(
                            '+',
                            style: GoogleFonts.montserrat(
                              color: Color(0xff48B6DB),
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    UniconsLine.heart,
                    color: secondaryBGColor,
                    size: 30,
                  ),
                  SizedBox(
                    width: 32,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              height: Get.height * 0.375,
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      constraints: BoxConstraints.expand(height: 50),
                      child: TabBar(tabs: [
                        Tab(
                          child: Text(
                            'Mô tả chi tiết',
                            style: GoogleFonts.montserrat(
                              color: primaryTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Đánh giá',
                            style: GoogleFonts.montserrat(
                              color: primaryTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Expanded(
                      child: Container(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 18),
                              child: Text(
                                widget.food.details,
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: primaryTextColor,
                                  height: 1.7,
                                ),
                              ),
                            ),
                            Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Comment(),
                                    Comment(),
                                    Comment(),
                                    Comment(),
                                    Comment(),
                                    Comment(),
                                    Comment(),
                                    Comment(),
                                  ],
                                ),
                              ),
                            ),
                            // InAppWebView(
                            //   initialUrlRequest: URLRequest(
                            //     url: Uri.parse(
                            //         '$apiURL/comment/${widget.food.id}'),
                            //   ),
                            //   initialOptions: InAppWebViewGroupOptions(
                            //     crossPlatform: InAppWebViewOptions(
                            //       supportZoom: false,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(26, 12, 26, 32),
        child: AuthButton(
          btnLabel: 'Thêm vào giỏ hàng',
          onPressed: _counter != 0
              ? () {
                  CartServices.addToCart(widget.food.id, _counter);
                  Get.dialog(
                    AlertDialog(
                      content: SizedBox(
                        height: 140,
                        child: Column(
                          children: [
                            Icon(
                              Icons.check_circle,
                              size: 100,
                              color: Colors.green,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Đã thêm vào giỏ hàng',
                              style: GoogleFonts.montserrat(
                                color: primaryTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              : null,
          btnColor: secondaryBGColor,
          textColor: Colors.white,
        ),
      ),
    );
  }
}

class Comment extends StatelessWidget {
  const Comment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              'Pham Duy',
              textAlign: TextAlign.justify,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: primaryTextColor,
                height: 1.7,
              ),
            ),
            Container(
              width: 260,
              child: Text(
                'test test test test test test test test test test test test test test',
                textAlign: TextAlign.justify,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: primaryTextColor,
                  height: 1.7,
                ),
              ),
            ),
          ],
        ),
        Text(
          '⭐️⭐️⭐️⭐️⭐️',
          textAlign: TextAlign.justify,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: primaryTextColor,
            height: 1.7,
          ),
        ),
      ],
    );
  }
}
