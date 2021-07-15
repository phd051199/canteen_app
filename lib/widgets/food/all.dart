import 'package:food_order/controllers/food/all.dart';
import 'package:food_order/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'one.dart';

class FoodsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 17, left: 4),
      child: SingleChildScrollView(
        child: GetX<FoodController>(
          init: FoodController(),
          builder: (_) => SizedBox(
            height: 330,
            child: _.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(secondaryBGColor),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _.foodList.length,
                    itemBuilder: (context, index) =>
                        FoodCard(food: _.foodList[index]),
                  ),
          ),
        ),
      ),
    );
  }
}
