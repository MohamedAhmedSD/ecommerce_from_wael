import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../core/constants/routes.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  //* 0. form key
  //* we use form to deal with our tff
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  //? ================== [deal with TEC, and its life cycle] =================
  //* make our TextEditingController, that we need to when complete TFF
  //* we need pw repeat for 2 times
  late TextEditingController password;
  late TextEditingController repassword;

  //* start life cycle of TEC
  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  //* end live cycle TEC
  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }

  //? ================ [resetpassword method] =================
  @override
  resetpassword() {}

  //? ================ [nav methods] =================
  //* nav to success page
  @override
  goToSuccessResetPassword() {
    if (formstate.currentState!.validate()) {
      Get.offNamed(AppRoute.successResetpassword);
    } else {
      if (kDebugMode) {
        print("Not Valid");
      }
    }
  }
}
