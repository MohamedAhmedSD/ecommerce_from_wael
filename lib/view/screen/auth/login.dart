import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/constants/color.dart';
import '../../widgets/auth/custombuttonauth.dart';
import '../../widgets/auth/customtextbodyauth.dart';
import '../../widgets/auth/customtextformauth.dart';
import '../../widgets/auth/customtexttitleauth.dart';
import '../../widgets/auth/logoauth.dart';
import '../../widgets/auth/texttoggle.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //* inject controller of login
    LoginControllerImp controller = Get.put(LoginControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('Sign In',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),

        //* use listView to carry scrollable list of widgets
        child: ListView(children: [
          const LogoAuth(),
          const SizedBox(height: 20),
          const CustomTextTitleAuth(text: "Welcome Back"),
          const SizedBox(height: 10),
          const CustomTextBodyAuth(
              text:
                  "Sign In With Your Email And Password OR Continue With Social Media"),
          const SizedBox(height: 15),
          CustonTextFormAuth(
            //* by controller I can listen to what written inside field
            mycontroller: controller.email,
            hinttext: "Enter Your Email",
            iconData: Icons.email_outlined,
            labeltext: "Email",
            // mycontroller: ,
          ),
          CustonTextFormAuth(
            mycontroller: controller.password,
            hinttext: "Enter Your Password",
            iconData: Icons.lock_outline,
            labeltext: "Password",
            // mycontroller: ,
          ),
          InkWell(
            onTap: () {
              // nav by call method that nav => goToForgetPassword
              controller.goToForgetPassword();
            },
            child: const Text(
              "Forget Password",
              textAlign: TextAlign.end,
            ),
          ),
          CustomButtomAuth(text: "Sign In", onPressed: () {}),
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
            textone: "Don't have an account ? ",
            texttwo: "SignUp",
            onTap: () {
              // nav by call method that nav to => goToSignUp
              controller.goToSignUp();
            },
          )
        ]),
      ),
    );
  }
}

//! [notes]:
/*
 * we can add focus node
 * we can use toggle if use one page for both logn && register 
 */