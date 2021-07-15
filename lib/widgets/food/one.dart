import 'dart:math';

import 'package:food_order/models/food.dart';
import 'package:food_order/screens/food_details.dart';
import 'package:food_order/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    required this.food,
  });
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => Get.to(() => FoodDetails(food: food)),
          child: Container(
            width: 261,
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Color(Random().nextInt(0xffffffff)).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 38),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Image.network(
                        food.image,
                        height: 180,
                        width: 180,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 190, left: 16, right: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      food.name,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, bottom: 12),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          child: Icon(
                            Icons.price_change_rounded,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            '${food.price} VND',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: primaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
