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
      //?===========================================================
      //! we wrap it under dialog widget == WillPopScope
      //? to tell user when press back is he ensure then exit
      //* wrap all under => WillPopScope
      //* it built-in widget
      //?===========================================================

      body: WillPopScope(
        //* take function we make it
        //* it show only if function alertExitApp => back true value
        onWillPop: alertExitApp,
        //! ====== if back false ===============
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          //* use listView to carry scrollable list of widgets

          child: Form(
            //* we bring our key from controller
            key: controller.formstate,
            child: ListView(children: [
              const LogoAuth(),
              const SizedBox(height: 20),
              //* when use tr == translation ensure you delete const from your widget
              // "Welcome Back"
              CustomTextTitleAuth(text: "10".tr),
              const SizedBox(height: 10),
              // "Sign In With Your Email And Password OR Continue With Social Media"
              CustomTextBodyAuth(text: "11".tr),
              const SizedBox(height: 15),
              CustomTextFormAuth(
                //* use our validator
                valid: (val) {
                  return validInput(val!, 5, 100, "email");
                },
                //* kb
                isNumber: false,
                //* by controller I can listen to what written inside field
                mycontroller: controller.email,
                // "Enter Your Email"
                hinttext: "12".tr,
                iconData: Icons.email_outlined,
                // "Email"
                labeltext: "18".tr, obscureText: false,
                onTapIcon: () {
                  //! empty != PW
                },
              ),
              //*==========================================
              //* we use GetBuilder => listen to UI refresh
              //*==========================================
              GetBuilder<LoginControllerImp>(
                builder: (controller) => CustomTextFormAuth(
                  //!=============== we use both =================
                  //?=========== obscureText && onTapIcon ========
                  obscureText: controller.isshowpassword,
                  //* here we use => onTapIcon => because we on PW
                  onTapIcon: () {
                    controller.showPassword();
                    //* but widget not refresh if not under => GetBuilder..
                  },
                  valid: (val) {
                    return validInput(val!, 5, 30, "password");
                  },
                  isNumber: false,
                  mycontroller: controller.password,
                  // "Enter Your Password"
                  hinttext: "13".tr,

                  iconData: Icons.lock_outline,
                  // "Password"
                  labeltext: "19".tr,
                ),
              ),

              InkWell(
                onTap: () {
                  //* nav by call method that nav => goToForgetPassword
                  controller.goToForgetPassword();
                },
                // "Forget Password"
                child: Text(
                  "14".tr,
                  //* we align it to end
                  textAlign: TextAlign.end,
                ),
              ),
              CustomButtonAuth(
                  // "Sign In"
                  text: "15".tr,
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
                // "Don't have an account ? "
                textone: "16".tr,
                // "SignUp"
                texttwo: "17".tr,
                onTap: () {
                  //* nav by call method that nav to => goToSignUp
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
