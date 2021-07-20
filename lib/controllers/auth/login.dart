import 'package:food_order/screens/home.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString currentUser = ''.obs;
  RxString jwt = ''.obs;
  RxBool isUserInvalid = true.obs;
  RxBool isPwdInvalid = true.obs;
  RxString usernameInvalidMsg = ''.obs;
  RxString pwdInvalidMsg = ''.obs;
  RxBool btnEnabled = false.obs;
  RxBool isLoading = false.obs;

  void onLoginError(String msg) {
    btnDispose();
    if (msg == 'Invalid Username') {
      isUserInvalid(true);
      usernameInvalidMsg('Tài khoản không tồn tại');
      pwdInvalidMsg('');
    } else if (msg == 'Invalid Password') {
      isPwdInvalid(true);
      pwdInvalidMsg('Sai mật khẩu');
    }
  }

  void onLoginSuccess() {
    Get.offAll(() => HomeScreen());
  }

  void inputUsernameOnchanged(String text) {
    if (GetUtils.isUsername(text) || GetUtils.isEmail(text)) {
      isUserInvalid(false);
      !isUserInvalid.value && !isPwdInvalid.value
          ? btnEnabled(true)
          : btnEnabled(false);
    } else {
      usernameInvalidMsg('');
      isUserInvalid(true);
      btnEnabled(false);
    }
  }

  void inputPasswordOnchanged(String text) {
    if (GetUtils.isPassport(text)) {
      isPwdInvalid(false);
      !isUserInvalid.value && !isPwdInvalid.value
          ? btnEnabled(true)
          : btnEnabled(false);
    } else {
      pwdInvalidMsg('');
      isPwdInvalid(true);
      btnEnabled(false);
    }
  }

  void btnDispose() {
    btnEnabled(false);
    isLoading(false);
  }
}
