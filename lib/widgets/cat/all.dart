import 'package:flutter/material.dart';
import 'package:food_order/controllers/category/all.dart';
import 'package:food_order/utils/constants.dart';
import 'package:food_order/widgets/cat/one.dart';
import 'package:get/get.dart';

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
