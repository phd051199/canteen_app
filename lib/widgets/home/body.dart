import 'package:food_order/controllers/category/all.dart';
import 'package:food_order/controllers/food/all.dart';
import 'package:food_order/controllers/food/popular.dart';
import 'package:food_order/models/category.dart';
import 'package:food_order/screens/view_list.dart';
import 'package:food_order/utils/constants.dart';
import 'package:food_order/widgets/cat/all.dart';
import 'package:food_order/widgets/food/all.dart';
import 'package:food_order/widgets/food/popular.dart';
import 'package:food_order/widgets/home/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              onTap: () => Get.to(
                () => ViewList(
                  cat: new Category(
                    id: '',
                    name: 'Tất cả món ăn mới',
                  ),
                  controller: Get.put(FoodController()),
                ),
              ),
            ),
          ),
          FoodsList(),
          Padding(
            padding: const EdgeInsets.only(top: 38, left: 25, right: 22),
            child: MainTitle(
              title: 'Món ăn phổ biến',
              rightText: 'View all',
              onTap: () => Get.to(
                () => ViewList(
                  cat: new Category(
                    id: '',
                    name: 'Tất cả món ăn phổ biến',
                  ),
                  controller: Get.put(PopularFoodController()),
                ),
              ),
            ),
          ),
          PopularFoodsList(),
        ],
      ),
    );
  }
}
