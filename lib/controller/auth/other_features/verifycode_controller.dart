import 'package:get/get.dart';

import '../../../core/constants/routes.dart';

abstract class VerifyCodeController extends GetxController {
  //* 1. checkCode process
  checkCode();

  //* 2. nav into ResetPassword page
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  //!============= why we use it? ===============
  //* we make empty string, when we need it

  late String verifycode;

  //? ================ [checkCode method] =================

  @override
  checkCode() {}

  //? ================ [nav methods] =================
  //* nav into successSignUp page
  //* after success go to reset pw
  @override
  goToResetPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }
}
