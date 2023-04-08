import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constants/route.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  // TEC, when forget we need use your email to send a message
  late TextEditingController email;

  // empty
  @override
  checkemail() {}

  // nan
  @override
  goToVerfiyCode() {
    Get.offNamed(AppRoute.verfiyCode);
  }

  // start
  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  // end
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
