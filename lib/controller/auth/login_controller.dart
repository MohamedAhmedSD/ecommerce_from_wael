import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/auth/login.dart';

abstract class LoginController extends GetxController {
  //* 0. form key
  //* we use form to deal with our tff
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  //* 1. Login process
  login();
  //* 2. nav into SignUp page
  goToSignUp();
  //* 3. nav into Forget Password page
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  //? we write our code logic here, to separate logic from view

  //? ================== [deal with TEC, and its life cycle] =================
  //* make our TextEditingController, that we need to when complete TFF
  late TextEditingController email;
  late TextEditingController password;

  //* start life cycle of TEC
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  //* end live cycle TEC
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  //? ================ [login method] =================

  //* when use login function
  LoginData loginData = LoginData(Get.find());
  StatusRequest? statusRequest;

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.homepage);
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      Get.defaultDialog(
        title: "ُWarning",
        middleText: "Wrong Email or Password",
      );
      statusRequest = StatusRequest.failure;
    }
  }
  //? ================ [nav methods] =================

  //* 2. nav into SignUp page
  @override
  goToSignUp() {
    //! toNmed , may cause duplicate Globalkey
    //? to avoid them use offNamed, [due to we go into page have also Global Key]
    //* Get.toNamed(AppRoute.signUp);

    Get.offNamed(AppRoute.signUp);
  }

  //* 3. nav into Forget Password page
  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  //? ================ [other methods] =================
  //* we need method to determine is PW hidden or not

  //* we make bool to deal with pw hidden or not
  bool isshowpassword = true;

  showPassword() {
    //* if true change to false , and vers versa == toggle
    isshowpassword = isshowpassword == true ? false : true;
    //! don't forget use update => UI update
    update();
  }
}
