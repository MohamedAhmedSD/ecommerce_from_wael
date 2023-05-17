import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/constants/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widgets/auth/custombuttonauth.dart';
import '../../widgets/auth/customtextbodyauth.dart';
import '../../widgets/auth/customtextformauth.dart';
import '../../widgets/auth/customtexttitleauth.dart';
import '../../widgets/auth/logoauth.dart';
import '../../widgets/auth/texttoggle.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

    //* we need wrap them ListView under Form,
    //* and all wrap under WillPopScope

  @override
  Widget build(BuildContext context) {
    //* inject controller of login

    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('9'.tr, //'Sign In'
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      // we wrap it under dialog widget
      // to tell user when press back is he sure then exit
            //* wrap all under => WillPopScope
      //* // it built-in widget

      body: WillPopScope(
        onWillPop: alertExitApp, //* take function we make it
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                   //* use listView to carry scrollable list of widgets

          child: Form(
            //* we bring our key from controller
            key: controller.formstate,
            child: ListView(
              children: [
              const LogoAuth(),
              const SizedBox(height: 20),
              //* when use tr == translation ensure you delete const from your widget
              CustomTextTitleAuth(text: "10".tr), // "Welcome Back"
              const SizedBox(height: 10),
              CustomTextBodyAuth(
                  text: "11"
                      .tr), // "Sign In With Your Email And Password OR Continue With Social Media"
              const SizedBox(height: 15),
              CustomTextFormAuth(
                // use our validator
                valid: (val) {
                  return validInput(val!, 5, 100, "email");
                },
                // kb
                isNumber: false,
                //* by controller I can listen to what written inside field
                mycontroller: controller.email,
                hinttext: "12".tr, // "Enter Your Email"
                iconData: Icons.email_outlined,
                labeltext: "18".tr, obscureText: false, onTapIcon: () {  }, // "Email"
                // mycontroller: ,
              ),
              GetBuilder<LoginControllerImp>(
                builder: (controller) => CustomTextFormAuth(
                  // we use both
                  // obscureText && onTapIcon
                  obscureText: controller.isshowpassword,
                  onTapIcon: () {
                    controller.showPassword();
                    // but widget not refresh if not under
                    // GetBuilder..
                  },
                  valid: (val) {
                    return validInput(val!, 5, 30, "password");
                  },
                  isNumber: false,
                  mycontroller: controller.password,
                  hinttext: "13".tr, // "Enter Your Password"

                  iconData: Icons.lock_outline,
                  labeltext: "19".tr, // "Password"
                  // mycontroller: ,
                ),
              ),

              InkWell(
                onTap: () {
                  // nav by call method that nav => goToForgetPassword
                  controller.goToForgetPassword();
                },
                child: Text(
                  "14".tr, // "Forget Password"
                  // we align it to end
                  textAlign: TextAlign.end,
                ),
              ),
              CustomButtomAuth(
                  text: "15".tr, // "Sign In"
                  onPressed: () {
                    controller.login();
                  }),
              const SizedBox(height: 40),
 //? =========== [we can use toggle here] =========
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: const [
              //     Text("Don't have an account ? "),
              //     InkWell(
              //       child: Text("Sign Up",
              //           style: TextStyle(
              //               color: AppColor.primaryColor,
              //               fontWeight: FontWeight.bold)),
              //     ),
              //   ],
              // ),

              //* use toggle now ===============================================   
                        CustomTextSignUpOrSignIn(
                textone: "16".tr, // "Don't have an account ? "
                texttwo: "17".tr, // "SignUp"
                onTap: () {
                  // nav by call method that nav to => goToSignUp
                  controller.goToSignUp();
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}


//! [notes]:
/*
 * we can add focus node
 * we can use toggle if use one page for both logn && register 
 */
