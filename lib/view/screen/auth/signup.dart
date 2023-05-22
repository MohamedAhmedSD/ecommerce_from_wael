import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../core/class/statusrequest.dart';
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
    //* inject controller
    // SignUpControllerImp controller = Get.put(SignUpControllerImp());
    Get.put(SignUpControllerImp());

    //! when use lazyPut no need to use Get.delete
    //* put we can n't take from lazy controller so wrap
    //* your main container under GetBuilder to use controller
    //* also we can use bindings with it

    // SignUpControllerImp controller =
    //     Get.lazyPut(() => SignUpControllerImp(), fenix: true);

    //! add loading => GetBuilder
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
      body: GetBuilder<SignUpControllerImp>(
        builder:
            (controller) => //* better use GetBuilder only on part we need to refresh its UI
                controller.statusRequest == StatusRequest.loading
                    ? const Center(child: Text("LOading"))
                    : WillPopScope(
                        onWillPop: alertExitApp,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          child: Form(
                            key: controller.formstate,
                            child: ListView(children: [
                              const SizedBox(height: 20),
                              //  "Welcome Back"
                              CustomTextTitleAuth(text: "10".tr),
                              const SizedBox(height: 10),
                              CustomTextBodyAuth(
                                  //"Sign Up With Your Email And Password OR Continue With Social Media"
                                  text: "24".tr),
                              const SizedBox(height: 15),
                              CustomTextFormAuth(
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 3, 20, "username");
                                },
                                mycontroller: controller.username,
                                // "Enter Your Username"
                                hinttext: "23".tr,
                                iconData: Icons.person_outline,
                                // "Username"
                                labeltext: "20".tr,
                              ),
                              CustomTextFormAuth(
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 3, 40, "email");
                                },
                                mycontroller: controller.email,
                                // "Enter Your Email"
                                hinttext: "12".tr,
                                iconData: Icons.email_outlined,
                                // "Email"
                                labeltext: "18".tr,
                              ),
                              CustomTextFormAuth(
                                valid: (val) {
                                  return validInput(val!, 7, 11, "phone");
                                },
                                isNumber: true,
                                mycontroller: controller.phone,
                                // "Enter Your Phone"
                                hinttext: "22".tr,
                                iconData: Icons.phone_android_outlined,
                                labeltext: "21".tr,
                                // "Phone"
                              ),
                              //* == password here not use obscuretext or hidden password method ==
                              CustomTextFormAuth(
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 3, 30, "password");
                                },
                                mycontroller: controller.password,
                                //"Enter Your Password"
                                hinttext: "13".tr,
                                iconData: Icons.lock_outline,
                                // "Password"
                                labeltext: "19".tr,
                                // mycontroller: ,
                              ),
                              CustomButtonAuth(
                                  // "Sign Up"
                                  text: "17".tr,
                                  onPressed: () {
                                    //* go to success sigup
                                    controller.signUp();
                                  }),
                              const SizedBox(height: 40),
                              //* toggle => nav to opposite
                              CustomTextSignUpOrSignIn(
                                // " have an account ? "
                                textone: "25".tr,
                                // " SignIn "
                                texttwo: "26".tr,
                                onTap: () {
                                  controller.goToSignIn();
                                },
                              ),
                            ]),
                          ),
                        ),
                      ),
      ),
    );
  }
}
