import 'package:food_order/screens/login.dart';
import 'package:food_order/utils/constants.dart';
import 'package:food_order/widgets/login/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up Successful 🎉',
                style: GoogleFonts.montserrat(
                  color: primaryTextColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Thanks for signing up. Welcome to our community. We are happy to have you on board.',
                style: GoogleFonts.montserrat(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 36,
              ),
              AuthButton(
                btnLabel: 'Back to Sign In',
                onPressed: () {
                  Get.offAll(() => LoginScreen());
                },
                btnColor: Colors.orangeAccent,
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
