import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../core/constants/route.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  //
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  // make our TextEditingController
  // that we need to full TFF
  late TextEditingController email;
  late TextEditingController password;

  // empty
  @override
  login() {
    // ar formdata = formstate.currentState;
    // if (formdata!.validate()) {
    //   if (kDebugMode) {
    //     print("Valid");
    //   }
    // } else {
    //   if (kDebugMode) {
    //     print("Not Valid");
    //   }
    // }
  }

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
