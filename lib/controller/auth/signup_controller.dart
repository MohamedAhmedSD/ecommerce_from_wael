import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../core/constants/route.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  //
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  // TEC
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  // empty
  @override
  signUp() {
    if (formstate.currentState!.validate()) {
      Get.offNamed(AppRoute.verfiyCodeSignUp);
      // to avoid cache memory we need delete memory
      // after nav me to next pge
      // so data will delete if I back to them
      Get.delete<SignUpControllerImp>();
      // our instead of use delete =>
      // we can use lazyPut as inject on our view page instead put
    } else {
      if (kDebugMode) {
        print("Not Valid");
      }
    }
  }

  // nav
  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  // start life cycle of TEC
  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  // end lifr cycle
  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
