import 'package:get/get.dart';

import '../../../core/constants/routes.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  //* 1. checkCode process
  checkCode();

  //* 2. nav into SuccessSignUp page
  goToSuccessSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  late String verifycode;

  @override
  checkCode() {}

  //? ================ [nav methods] =================
  //* nav into successSignUp page
  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoute.successSignUp);
  }
}
