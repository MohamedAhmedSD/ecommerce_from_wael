import 'package:get/get.dart';

import '../../../core/constants/routes.dart';

abstract class SuccessSignUpController extends GetxController {
  //* 1. nav into Login page
  goToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  //? ================ [nav methods] =================
  //* nav into Login page
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
