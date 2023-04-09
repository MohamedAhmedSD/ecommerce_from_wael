import 'package:get/get.dart';

import '../../core/constants/route.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  // why we use it?
  // we make empty string, when we need it 
  late String verifycode;

  @override
  checkCode() {}

  // after success go to reset pw
  @override
  goToResetPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }
}
