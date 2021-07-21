import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_order/models/category.dart';
import 'package:food_order/models/food.dart';
import 'package:food_order/screens/food_details.dart';
import 'package:food_order/utils/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewList extends StatelessWidget {
  const ViewList({
    Key? key,
    this.cat,
    this.controller,
  }) : super(key: key);
  final Category? cat;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: secondaryBGColor,
        ),
        centerTitle: false,
        title: Text(
          cat != null ? cat!.name : 'Kết quả tìm kiếm',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: primaryTextColor,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
        height: Get.height,
        child: Obx(
          () {
            if (controller.isLoading.value)
              return Center(
                child: CircularProgressIndicator(
                  color: secondaryBGColor,
                ),
              );
            else
              return StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: controller.foodList.length,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                itemBuilder: (context, index) =>
                    FoodTitle(controller.foodList[index]),
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              );
          },
        ),
      ),
    );
  }
}

class FoodTitle extends StatelessWidget {
  final Food food;
  const FoodTitle(this.food);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => FoodDetails(
            food: food,
          )),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    height: 160,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      '$apiURL/uploads/${food.image}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text(
                food.name,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: primaryTextColor,
                ),
              ),
              subtitle: Text(
                '${food.price} VNĐ',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: primaryTextColor.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white30,
              Colors.white,
            ],
          ),
        ),
      ),
    );
  }
}
