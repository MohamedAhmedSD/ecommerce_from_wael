import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

//? bito extension =>
// bito => workplace => https://alpha.bito.co/auth/login?red=ws&TgVDJu0YJT4YlTqJA6izLGwGbc7OispF5_nazrADdeQ=

import '../../../core/constants/routes.dart';

//? The ForgetPasswordControllerImp class is a concrete implementation of
//* the abstract ForgetPasswordController class that contains methods for
//* handling the user's actions.

abstract class ForgetPasswordController extends GetxController {
  //* 1. checkemail process
  checkemail();
  //* 2. nav into VerfiyCode page
  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  //* 0. form key
  //* we use form to deal with our tff
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  //? ================== [deal with TEC, and its life cycle] =================
  //* make our TextEditingController, that we need to when complete TFF
  //* when forget our data, we need use your email to send a message
  late TextEditingController email;

  //* start life cycle of TEC
  //* The onInit() method is called when the controller is initialized and is used to instantiate the email TextEditingController so that the user can enter their email address.

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  //* end live cycle TEC
  //* Finally, the dispose() method is called when the controller is no longer needed and is used to dispose of the email TextEditingController.

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  //? ================ [checkemail method] =================
  //* The checkemail() method is responsible for verifying the user's email
  //* and ensuring it is valid.

  @override
  checkemail() {}

  //? ================ [nav methods] =================
  /// The goToVerfiyCode() method is responsible for navigating the user to the verification code page once the email is valid.

  @override
  goToVerfiyCode() {
    if (formstate.currentState!.validate()) {
      Get.offNamed(AppRoute.verfiyCode);
    } else {
      if (kDebugMode) {
        print("Not Valid");
      }
    }
  }
}
