import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constants/routes.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/auth/verifycode_signup.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  //* 1. checkCode process
  checkCode();

  //* 2. nav into SuccessSignUp page
  goToSuccessSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  //!============= why we use it? ===============
  //* we make empty string, use later on checkcode()

  late String verifycode;

  //? ================ [ we need recive email from signup page] =================
  String? email;
  //* use onInit => to get its arguments value

  //? ================ [checkCode method] =================

  @override
  checkCode() {}

  //? ================ [goToSuccessSignUp method] =================
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  StatusRequest? statusRequest;
  //* nav into successSignUp page

  //? we need pass parameter == our verify code 
  @override
  goToSuccessSignUp() async {
//* like signup code
    //* we follow StatusRequest steps
    statusRequest = StatusRequest.loading;
    //! don't forget use update => to refresh UI
    update();

    //* save what back from testdata inside => response var
    var response = await verifyCodeSignUpData.postdata(email!, verifycode);
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    statusRequest = StatusRequest.success;
    update();

    //* when success
    if (response is Map && response.containsKey('status')) {
      if (response['status'] == "success") {
        //* we need to pass email into verify page, so do that as Map
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(title: "ُWarning", middleText: "Wrong Verify Code");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    //* get email value
    email = Get.arguments['email'];
  }
}
