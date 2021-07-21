import 'package:food_order/controllers/food/bycat.dart';
import 'package:food_order/models/category.dart';
import 'package:food_order/screens/view_list.dart';
import 'package:food_order/utils/constants.dart';
import 'package:food_order/widgets/food/all.dart';
import 'package:food_order/widgets/home/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    Key? key,
    required this.fullName,
    required this.email,
  }) : super(key: key);
  final String fullName, email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 140),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image(
                image: AssetImage('assets/images/avatar.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                fullName,
                style: GoogleFonts.montserrat(
                  color: primaryTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                email,
                style: GoogleFonts.montserrat(
                  color: primaryTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Divider(
                color: primaryTextColor,
                height: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 38, left: 25, right: 22),
              child: MainTitle(
                title: 'Món ăn gần đây',
                rightText: 'View all',
                onTap: () => Get.to(
                  () => ViewList(
                    cat: new Category(
                      id: '',
                      name: 'Tất cả món ăn gần đây',
                    ),
                    controller: Get.put(FoodByCatController(cat: '')),
                  ),
                ),
              ),
            ),
            FoodsList(),
          ],
        ),
      ),
    );
  }
}
