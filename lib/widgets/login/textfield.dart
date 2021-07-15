import 'package:food_order/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthInput extends StatelessWidget {
  const AuthInput({
    Key? key,
    required this.label,
    required this.onChanged,
    required this.isInvalid,
    required this.inputController,
    this.isPwdField,
    this.errorText,
  }) : super(key: key);

  final String label;
  final bool isInvalid;
  final TextEditingController inputController;
  final bool? isPwdField;
  final String? errorText;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    bool showPass = false;
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: TextField(
            controller: inputController,
            onChanged: onChanged,
            obscureText: isPwdField == true ? !showPass : false,
            decoration: InputDecoration(
              labelText: label,
              errorText: errorText,
              labelStyle: GoogleFonts.montserrat(
                color: primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: primaryTextColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: inputController.text.length > 0
                      ? (isInvalid ? Colors.red : Colors.green)
                      : primaryTextColor,
                ),
              ),
            ),
            style: GoogleFonts.montserrat(
              color: primaryTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            cursorColor: primaryTextColor,
          ),
        ),
        inputController.text.length > 0
            ? (isInvalid
                ? Icon(
                    Icons.close,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.check,
                    color: Colors.green,
                  ))
            : SizedBox(),
      ],
    );
  }
}
