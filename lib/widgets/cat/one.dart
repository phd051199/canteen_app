import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_order/controllers/food/bycat.dart';
import 'package:food_order/models/category.dart';
import 'package:food_order/screens/view_list.dart';
import 'package:food_order/utils/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.cat}) : super(key: key);
  final Category cat;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () => Get.to(
          () => ViewList(
            cat: cat,
            controller: Get.put(FoodByCatController(cat: '${cat.id}')),
          ),
        ),
        child: SizedBox(
          height: 140,
          width: 95,
          child: Column(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(Random().nextInt(0xffffffff)).withOpacity(0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Image.network(
                      '$apiURL/uploads/${cat.image}',
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                cat.name,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: primaryTextColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
