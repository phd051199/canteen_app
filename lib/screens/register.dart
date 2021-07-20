import 'package:food_order/controllers/auth/register.dart';
import 'package:food_order/services/auth.dart';
import 'package:food_order/utils/constants.dart';
import 'package:food_order/widgets/login/button.dart';
import 'package:food_order/widgets/login/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameInputController = TextEditingController();
    TextEditingController fullnameInputController = TextEditingController();
    TextEditingController passwordInputController = TextEditingController();
    TextEditingController emailInputController = TextEditingController();
    TextEditingController retypePasswordInputController =
        TextEditingController();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: secondaryBGColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: GetX<RegisterController>(
            init: RegisterController(),
            builder: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Đăng ký',
                  style: GoogleFonts.montserrat(
                    color: primaryTextColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text(
                      'Đã có tài khoản ? ',
                      style: GoogleFonts.montserrat(
                        color: primaryTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Text(
                        'Đăng nhập',
                        style: GoogleFonts.montserrat(
                          color: secondaryBGColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 38,
                ),
                AuthInput(
                  inputController: usernameInputController,
                  label: 'Username',
                  errorText:
                      _.isUserInvalid.value && _.usernameInvalidMsg.value != ''
                          ? _.usernameInvalidMsg.value
                          : null,
                  isInvalid: _.isUserInvalid.value,
                  onChanged: (text) => _.inputUsernameOnchanged(text),
                ),
                AuthInput(
                  inputController: fullnameInputController,
                  label: 'Full Name',
                  isInvalid: _.isFullnameInvalid.value,
                  onChanged: (text) => _.inputFullnameOnchanged(text),
                ),
                AuthInput(
                  inputController: emailInputController,
                  label: 'Email',
                  errorText:
                      _.isEmailInvalid.value && _.emailInvalidMsg.value != ''
                          ? _.emailInvalidMsg.value
                          : null,
                  isInvalid: _.isEmailInvalid.value,
                  onChanged: (text) => _.inputEmailOnchanged(text),
                ),
                AuthInput(
                  inputController: passwordInputController,
                  label: 'Password',
                  isPwdField: true,
                  isInvalid: _.isPwdInvalid.value,
                  onChanged: (text) => _.inputPasswordOnchanged(text),
                ),
                AuthInput(
                  inputController: retypePasswordInputController,
                  label: 'Retyped Password',
                  isPwdField: true,
                  isInvalid: _.isRPwdInvalid.value,
                  onChanged: (text) {
                    if (retypePasswordInputController.text ==
                        passwordInputController.text) {
                      _.isRPwdInvalid(false);
                      _.checkAll();
                    } else {
                      _.isRPwdInvalid(true);
                      _.btnEnabled(false);
                    }
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                AuthButton(
                  icon: _.isLoading.value
                      ? SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                            color: secondaryBGColor,
                          ),
                        )
                      : null,
                  btnLabel: _.isLoading.value ? '' : 'Đăng ký',
                  onPressed: _.btnEnabled.value
                      ? () {
                          _.btnEnabled(false);
                          _.isLoading(true);
                          AuthServices.register(
                            usernameInputController.text,
                            fullnameInputController.text,
                            emailInputController.text,
                            passwordInputController.text,
                            _.onRegSuccess,
                            _.onRegError,
                          );
                        }
                      : null,
                  btnColor: secondaryBGColor,
                  textColor: _.btnEnabled.value ? Colors.white : Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
