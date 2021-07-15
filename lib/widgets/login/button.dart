import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.btnLabel,
    required this.onPressed,
    required this.btnColor,
    required this.textColor,
    this.icon,
  }) : super(key: key);

  final String btnLabel;
  final Function()? onPressed;
  final Color btnColor;
  final Color textColor;
  final icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: icon == null
            ? Text(
                btnLabel,
                style: GoogleFonts.montserrat(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  SizedBox(
                    width: 15.5,
                  ),
                  Text(
                    btnLabel,
                    style: GoogleFonts.montserrat(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
