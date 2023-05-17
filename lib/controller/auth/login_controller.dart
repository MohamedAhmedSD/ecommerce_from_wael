import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constants/routes.dart';

abstract class LoginController extends GetxController {
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
  login() {}
  //? ================ [nav methods] =================

  //* 2. nav into SignUp page
  @override
  goToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  //* 3. nav into Forget Password page
  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
