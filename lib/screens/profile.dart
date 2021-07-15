import 'package:food_order/widgets/profile/appbar.dart';
import 'package:food_order/widgets/profile/body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ProfileAppBar(),
          ProfileBody(
            fullName: 'Pham Duy',
            email: 'phamduy@gmail.com',
          ),
        ],
      ),
    );
  }
}
