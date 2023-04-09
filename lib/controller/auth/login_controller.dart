import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constants/route.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  // make our TextEditingController
  // that we need to full TFF
  late TextEditingController email;
  late TextEditingController password;

  // empty
  @override
  login() {}

  // nav
  @override
  goToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  // start life cycle of TEC
  /// Initialize TextEditingController objects for email and password
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  // end live cycle TEC
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  // nav
  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
