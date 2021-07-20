import 'package:food_order/controllers/auth/register.dart';
import 'package:food_order/services/auth.dart';
import 'package:food_order/utils/constants.dart';
import 'package:food_order/widgets/login/button.dart';
import 'package:food_order/widgets/login/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailInputController = new TextEditingController();
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
                'Quên mật khẩu ?',
                style: GoogleFonts.montserrat(
                  color: primaryTextColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Nhập địa chỉ email được liên kết với tài khoản của bạn.',
                style: GoogleFonts.montserrat(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 28),
                child: AuthInput(
                  inputController: emailInputController,
                  label: 'Nhập Email',
                  isInvalid: _.isEmailInvalid.value,
                  onChanged: (text) => _.inputEmailFGOnchanged(text),
                ),
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
                btnLabel: _.isLoading.value ? '' : 'Gửi email khôi phục',
                onPressed: _.btnEnabled.value
                    ? () {
                        _.btnEnabled(false);
                        _.isLoading(true);
                        if (!_.isEmailInvalid.value) {
                          AuthServices.forgot(
                            emailInputController.text,
                          );
                        }
                      }
                    : null,
                btnColor: secondaryBGColor,
                textColor: _.btnEnabled.value ? Colors.white : Colors.grey,
              ),
              SizedBox(
                height: 24,
              ),
              AuthButton(
                btnLabel: 'Trở về đăng nhập',
                onPressed: () => Get.back(),
                btnColor: Color(0xff444444),
                textColor: Colors.white,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
