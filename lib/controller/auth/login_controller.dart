import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../core/constants/route.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  // we use form to deal with our tff
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  // make our TextEditingController
  // that we need to full TFF
  late TextEditingController email;
  late TextEditingController password;

  // empty
  @override
  login() {
    // when use login function
    // we need check is our field vaild according our validators our not
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      if (kDebugMode) {
        print("Valid");
      }
    } else {
      if (kDebugMode) {
        print("Not Valid");
      }
    }
  }

  // nav
  @override
  goToSignUp() {
    // toNmed , may cause duplicate Globalkey
    // to avoid them use offNamed
    // Get.toNamed(AppRoute.signUp);
    Get.offNamed(AppRoute.signUp);
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
