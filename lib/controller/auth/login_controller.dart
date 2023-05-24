import 'package:ecommerce_wah/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/auth/login.dart';

// abstract class LoginController extends GetxController {
//   //* 0. form key
//   //* we use form to deal with our tff
//   GlobalKey<FormState> formstate = GlobalKey<FormState>();

//   //* 1. Login process
//   login();
//   //* 2. nav into SignUp page
//   goToSignUp();
//   //* 3. nav into Forget Password page
//   goToForgetPassword();
// }

// class LoginControllerImp extends LoginController {
//   //? we write our code logic here, to separate logic from view

//   //? ================== [deal with TEC, and its life cycle] =================
//   //* make our TextEditingController, that we need to when complete TFF
//   late TextEditingController email;
//   late TextEditingController password;

//   //* start life cycle of TEC
//   @override
//   void onInit() {
//     email = TextEditingController();
//     password = TextEditingController();
//     super.onInit();
//   }

//   //* end live cycle TEC
//   @override
//   void dispose() {
//     email.dispose();
//     password.dispose();
//     super.dispose();
//   }

//   //? ================ [login method] =================

//   //* when use login function
//   LoginData loginData = LoginData(Get.find());
//   StatusRequest? statusRequest;

//   @override
//   login() async {
//     if (formstate.currentState!.validate()) {
//       statusRequest = StatusRequest.loading;
//       update();

//       var response = await loginData.postdata(email.text, password.text);
//       // var response = await loginData.postdata(password.text,email.text,);
//       print("=============================== Controller $response ");

//       statusRequest = handlingData(response);

//       if (StatusRequest.success == statusRequest) {
//         if (response['status'] == "success") {
//           // data.addAll(response['data']);
//           Get.offNamed(AppRoute.homepage);
//         } else {
//           Get.defaultDialog(
//               title: "ُWarning", middleText: "Email Or Password Not Correct");
//           statusRequest = StatusRequest.failure;
//         }
//       }
//       update();
//     } else {}
//   }
//   //? ================ [nav methods] =================

//   //* 2. nav into SignUp page
//   @override
//   goToSignUp() {
//     //! toNmed , may cause duplicate Globalkey
//     //? to avoid them use offNamed, [due to we go into page have also Global Key]
//     //* Get.toNamed(AppRoute.signUp);

//     Get.offNamed(AppRoute.signUp);
//   }

//   //* 3. nav into Forget Password page
//   @override
//   goToForgetPassword() {
//     Get.toNamed(AppRoute.forgetPassword);
//   }

//   //? ================ [other methods] =================
//   //* we need method to determine is PW hidden or not

//   //* we make bool to deal with pw hidden or not
//   bool isshowpassword = true;

//   showPassword() {
//     //* if true change to false , and vers versa == toggle
//     isshowpassword = isshowpassword == true ? false : true;
//     //! don't forget use update => UI update
//     update();
//   }
// }

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;

  //* to call SharedPrefs
  MyServices myServices = Get.find();

  StatusRequest? statusRequest;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      statusRequest = StatusRequest.success;
      update();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          // print(response);
          // print("=================================");

          //* add data that get by getdata method on login.php to
          //* save [id, email, phone ..] by SharedPrefs

          //? respose => back 2 keys on of them == data => to access data come from php
          //! which get DB column names
          myServices.sharedPreferences
              // .setString("id", response['data']['users_id']);
              .setInt("id", response['data']['users_id']);
          myServices.sharedPreferences
              .setString("username", response['data']['users_name']);
          myServices.sharedPreferences
              .setString("email", response['data']['users_email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['users_phone']);
          // //! add also step key to be the scond place to skip if
          // //! we reach to it => first place was == onboarding
          myServices.sharedPreferences.setString("step", "2");

          //* now you can nav into homepage
          Get.offNamed(AppRoute.homepage);
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
