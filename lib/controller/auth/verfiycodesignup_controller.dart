import 'package:get/get.dart';

import '../../core/constants/route.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {  

  late String verifycode  ; 

  @override
  checkCode() {}

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoute.successSignUp);
  }

  // @override
  // void onInit() {  
  //   super.onInit();
  // }

 
}
