import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../core/constants/routes.dart';

abstract class LoginController extends GetxController {
  //* 0. form key
  //* we use form to deal with our tff

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  //* 1. Login process
  login();
  //* 2. nav into SignUp page
  goToSignUp();
  //* 3. nav into Forget Password page
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  //? we write our code logic here, to separate logic from view

  //? ================== [deal with TEC, and its life cycle] =================
  //* make our TextEditingController, that we need to when complete TFF
  late TextEditingController email;
  late TextEditingController password;

  //* start life cycle of TEC
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  //* end live cycle TEC
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  //? ================ [login method] =================

  //* empty till written
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

  //? ================ [nav methods] =================

  //* 2. nav into SignUp page
  @override
  goToSignUp() {
    // toNmed , may cause duplicate Globalkey
    // to avoid them use offNamed
    // Get.toNamed(AppRoute.signUp);
    Get.offNamed(AppRoute.signUp);
  }

  //* 3. nav into Forget Password page
  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  // we make bool to deal with pw hidden or not
  bool isshowpassword = true;

  showPassword() {
    // if true change to false , and vers versa
    isshowpassword = isshowpassword == true ? false : true;
    // don't forget use update => UI update
    update();
  }
}
