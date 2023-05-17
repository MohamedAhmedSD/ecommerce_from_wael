import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../core/constants/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widgets/auth/custombuttonauth.dart';
import '../../widgets/auth/customtextbodyauth.dart';
import '../../widgets/auth/customtextformauth.dart';
import '../../widgets/auth/customtexttitleauth.dart';
import '../../widgets/auth/texttoggle.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // inject controller
    SignUpControllerImp controller = Get.put(SignUpControllerImp());

    // when use lazyPut no need to use Get.delete
    // put we can n't take from lazy controller so wrap
    // your container under GetBuilder to use controller
    // also we can use bindings with it
    // SignUpControllerImp controller = Get.lazyPut(() => SignUpControllerImp(),finix:true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('17'.tr, // 'Sign Up'
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: //GetBuilder<SignUpControllerImp>(
          WillPopScope(
        // it built0in widget
        onWillPop: alertExitApp, // take function we make it
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formstate,
            child: ListView(children: [
              const SizedBox(height: 20),
              CustomTextTitleAuth(text: "10".tr), //  "Welcome Back"
              const SizedBox(height: 10),
              CustomTextBodyAuth(
                  text: "24"
                      .tr), //"Sign Up With Your Email And Password OR Continue With Social Media"
              const SizedBox(height: 15),
              CustomTextFormAuth(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 3, 20, "username");
                },
                // using controller
                mycontroller: controller.username,
                hinttext: "23".tr, // "Enter Your Username"
                iconData: Icons.person_outline,
                labeltext: "20".tr, // "Username"
                // mycontroller: ,
              ),
              CustomTextFormAuth(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 3, 40, "email");
                },
                mycontroller: controller.email,
                hinttext: "12".tr, // "Enter Your Email"
                iconData: Icons.email_outlined,
                labeltext: "18".tr, // "Email"
                // mycontroller: ,
              ),
              CustomTextFormAuth(
                valid: (val) {
                  return validInput(val!, 7, 11, "phone");
                },
                isNumber: true,
                mycontroller: controller.phone,
                hinttext: "22".tr, // "Enter Your Phone"
                iconData: Icons.phone_android_outlined,
                labeltext: "21".tr, // "Phone"
                // mycontroller: ,
              ),
              CustomTextFormAuth(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 3, 30, "password");
                },
                mycontroller: controller.password,
                hinttext: "13".tr, //"Enter Your Password"
                iconData: Icons.lock_outline,
                labeltext: "19".tr, // "Password"
                // mycontroller: ,
              ),
              CustomButtomAuth(
                  text: "Sign Up", // "Sign Up"
                  onPressed: () {
                    controller.signUp();
                    // go to success sigup
                  }),
              const SizedBox(height: 40),
              // nav to opposite
              CustomTextSignUpOrSignIn(
                textone: "25".tr, // " have an account ? "
                texttwo: "26".tr, // " SignIn "
                onTap: () {
                  controller.goToSignIn();
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
