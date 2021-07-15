import 'package:food_order/widgets/profile/appbar.dart';
import 'package:food_order/widgets/profile/body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.fullName,
  }) : super(key: key);
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ProfileAppBar(),
          ProfileBody(
            fullName: fullName,
            email: 'phamduy@gmail.com',
          ),
        ],
      ),
    );
  }
}
