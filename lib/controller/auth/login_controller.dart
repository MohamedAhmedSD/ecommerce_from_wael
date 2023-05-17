import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../core/constants/routes.dart';

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
  @override
  login() {
    //* we need check is our fields vaild according our validators our not
    //? determines it by using formstate

    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      if (kDebugMode) {
        print("Valid");
      }
    } else {
      if (kDebugMode) {
        print("Not Valid");
      }
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
