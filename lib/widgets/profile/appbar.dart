import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      flexibleSpace: Container(
        child: context.isPortrait
            ? Image(
                image: AssetImage('assets/images/bgprofile.png'),
                fit: BoxFit.fill,
                colorBlendMode: BlendMode.darken,
                color: Color(0xff2A3447).withOpacity(0.5),
              )
            : null,
      ),
      title: Text(
        'Profile',
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      centerTitle: false,
    );
  }
}
