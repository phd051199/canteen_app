import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    required this.title,
    required this.menuItemClicked,
  });

  final String title;
  final Function() menuItemClicked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: menuItemClicked,
      horizontalTitleGap: 0.0,
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}
