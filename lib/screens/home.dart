import 'package:food_order/controllers/auth/login.dart';
import 'package:food_order/utils/constants.dart';
import 'package:food_order/widgets/home/body.dart';
import 'package:food_order/widgets/home/search.dart';
import 'package:food_order/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            'Xin chào, ${loginController.currentUser.value} 👋',
            style: GoogleFonts.montserrat(
              color: primaryTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: SearchBar(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: GestureDetector(
              onTap: () => Get.to(
                () => ProfileScreen(
                  fullName: loginController.currentUser.value,
                ),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Image(
                  image: AssetImage('assets/images/avatar.png'),
                  height: 46,
                  width: 46,
                ),
              ),
            ),
          ),
        ],
      ),
      body: HomeBody(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: secondaryBGColor,
        unselectedItemColor: primaryTextColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              UniconsLine.estate,
            ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              UniconsLine.shopping_bag,
            ),
            label: 'Giỏ hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              UniconsLine.search,
            ),
            label: 'Tìm kiếm',
          ),
        ],
      ),
    );
  }
}
