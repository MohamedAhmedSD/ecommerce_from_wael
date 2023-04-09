import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../core/constants/route.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController { 
  //
    GlobalKey<FormState> formstate = GlobalKey<FormState>();

  // TEC
  // we need pw repeat for 2 times
  late TextEditingController password; 
  late TextEditingController repassword; 

  // empty
  @override
  resetpassword() {}
  // nav to success page
  @override
  goToSuccessResetPassword() {
 if (formstate.currentState!.validate()) {
      Get.offNamed(AppRoute.successResetpassword);
    } else {
      if (kDebugMode) {
        print("Not Valid");
      }
    }  }

  // life cycle start & end
  @override
  void onInit() { 
    password = TextEditingController(); 
    repassword = TextEditingController(); 
    super.onInit();
  }

  @override
  void dispose() { 
    password.dispose(); 
    repassword.dispose(); 
    super.dispose();
  }
}
