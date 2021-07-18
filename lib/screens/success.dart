import 'package:food_order/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    Key? key,
    required this.title,
    required this.content,
    this.successBtn,
  }) : super(key: key);
  final String title, content;
  final successBtn;
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
                title,
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
                content,
                style: GoogleFonts.montserrat(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 36,
              ),
              successBtn,
            ],
          ),
        ),
      ),
    );
  }
}
