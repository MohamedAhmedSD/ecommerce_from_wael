import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constants/route.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController { 
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
    Get.offNamed(AppRoute.verfiyCode);
  }

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
