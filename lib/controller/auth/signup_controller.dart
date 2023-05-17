import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

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
  signUp() {
    //* we need check is our fields vaild according our validators our not
    //? determines it by using formstate
    if (formstate.currentState!.validate()) {
      Get.offNamed(AppRoute.verfiyCodeSignUp);
      //* to avoid cache memory we need delete <controller> from memory
      //? after nav me to next pge
      //! so data will delete if I back to them

      //* ======== we delete our controller ======
      Get.delete<SignUpControllerImp>();
      //* or instead of use delete =>
      //* we can use Get.lazyPut as inject on our view page instead Get.put
    } else {
      if (kDebugMode) {
        print("Not Valid");
      }
    }
  }

  //? ================ [nav methods] =================
  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }
}
