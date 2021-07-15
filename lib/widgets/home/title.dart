import 'package:food_order/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    required this.title,
    required this.rightText,
  });

  final String title, rightText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: primaryTextColor,
          ),
        ),
        Text(
          rightText,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            color: secondaryBGColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
