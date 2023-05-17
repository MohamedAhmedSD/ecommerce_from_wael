import 'package:get/get.dart';

import '../../../core/constants/routes.dart';

abstract class SuccessResetPasswordController extends GetxController {
  //* 1. nav into Login page
  goToPageLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  //? ================ [nav methods] =================
  //* nav into Login page

  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
