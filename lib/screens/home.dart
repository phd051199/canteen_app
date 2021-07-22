import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:food_order/controllers/food/byname.dart';
import 'package:food_order/screens/cart.dart';
import 'package:food_order/screens/order.dart';
import 'package:food_order/screens/view_list.dart';
import 'package:food_order/utils/constants.dart';
import 'package:food_order/widgets/home/body.dart';
import 'package:food_order/widgets/home/search.dart';
import 'package:food_order/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  TextEditingController searchBarInputController = TextEditingController();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _url = 'https://phamduy.me/chat';
  getBody() {
    if (_selectedIndex == 0) {
      return HomeBody();
    } else if (_selectedIndex == 1) {
      return CartPage();
    } else if (_selectedIndex == 2) {
      return OrderList();
    } else if (_selectedIndex == 3) {
      return InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(_url),
        ),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            supportZoom: false,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            _selectedIndex == 0
                ? 'Xin chào 👋'
                : _selectedIndex == 1
                    ? 'Giỏ hàng 🛒'
                    : _selectedIndex == 2
                        ? 'Đơn hàng'
                        : 'Chat',
            style: GoogleFonts.montserrat(
              color: primaryTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
        ),
        centerTitle: false,
        bottom: _selectedIndex == 0
            ? PreferredSize(
                preferredSize: Size.fromHeight(70),
                child: SearchBar(
                  inputController: searchBarInputController,
                  submit: (context) {
                    Get.to(
                      () => ViewList(
                        controller: Get.put(
                          FoodByNameController(foodName: context),
                        ),
                      ),
                    );
                  },
                ),
              )
            : null,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: GestureDetector(
              onTap: () => Get.to(
                () => ProfileScreen(),
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
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: secondaryBGColor,
        unselectedItemColor: primaryTextColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
              UniconsLine.list_ui_alt,
            ),
            label: 'Đơn hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              UniconsLine.chat,
            ),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}
