import 'package:get/get.dart';

import '../../core/constants/route.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  // why we use it?
  late String verifycode;

  @override
  checkCode() {}

  @override
  goToResetPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }
}
