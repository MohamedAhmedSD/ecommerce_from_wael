import 'package:ecommerce_wah/data/datasource/remote/auth/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constants/routes.dart';

abstract class SignUpController extends GetxController {
  //* 1. signUp process
  signUp();
  //* 2. nav into Sign in page
  goToSignIn();
}

class SignUpControllerOneImp extends SignUpController {
  //? we write our code logic here, to separate logic from view
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  //? ================== [deal with TEC, and its life cycle] =================
  //* make our TextEditingController, that we need to when complete TFF
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  //* start life cycle of TEC
  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  //* end life cycle TEC
  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  // StatusRequest statusRequest = StatusRequest.none;

  SignupData signupData = SignupData(Get.find());
  List data = [];

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      //* save what back from testdata inside => response var
      var response = await signupData.postdata(
          username.text, password.text, email.text, phone.text);
      print("=============================== Controller $response ");

      //* when success
      if (response is Map && response.containsKey('status')) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.verfiyCodeSignUp,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "ُWarning",
              middleText: "Phone Number Or Email Already Exists");
        }
      }
      update();
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }
}
