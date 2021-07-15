import 'dart:math';

import 'package:food_order/controllers/category/all.dart';
import 'package:food_order/controllers/food/all.dart';
import 'package:food_order/models/food.dart';
import 'package:food_order/utils/constants.dart';
import 'package:food_order/widgets/food/all.dart';
import 'package:food_order/widgets/home/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FoodController foodController = Get.put(FoodController());
    final CategoryController categoryController = Get.put(CategoryController());
    return RefreshIndicator(
      color: secondaryBGColor,
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 800));
        foodController.fetchFoods();
        categoryController.fetchCats();
      },
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 33, 25, 12),
            child: MainTitle(
              title: 'Danh mục',
              rightText: '',
            ),
          ),
          CategoryList(),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 28, 25, 0),
            child: MainTitle(
              title: 'Món ăn mới',
              rightText: 'View all',
            ),
          ),
          FoodsList(),
          Padding(
            padding: const EdgeInsets.only(top: 38, left: 25, right: 22),
            child: MainTitle(
              title: 'Món ăn phổ biến',
              rightText: 'View all',
            ),
          ),
          FoodsList(),
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 12),
      child: SingleChildScrollView(
        child: GetX<CategoryController>(
          init: CategoryController(),
          builder: (_) => SizedBox(
            height: 150,
            child: _.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(secondaryBGColor),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _.catList.length,
                    itemBuilder: (context, index) =>
                        CategoryItem(cat: _.catList[index]),
                  ),
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.cat}) : super(key: key);
  final Category cat;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Image(
                    image: AssetImage(cat.desc),
                    height: 70,
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
    );
  }
}
