import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constants/routes.dart';

abstract class SignUpController extends GetxController {
  //* 1. signUp process
  signUp();
  //* 2. nav into Sign in page
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  //? we write our code logic here, to separate logic from view

  //? ================== [deal with TEC, and its life cycle] =================
  //* make our TextEditingController, that we need to when complete TFF

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  //* start life cycle of TEC
  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  //* end life cycle TEC
  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  //? ================ [signUp method] =================

  //* 1. signUp process
  @override
  signUp() {}

  //? ================ [nav methods] =================
  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }
}
