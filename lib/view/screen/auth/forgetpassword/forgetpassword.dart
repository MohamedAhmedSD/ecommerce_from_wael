import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpassword_controller.dart';
import '../../../../core/constants/color.dart';
import '../../../widgets/auth/custombuttonauth.dart';
import '../../../widgets/auth/customtextbodyauth.dart';
import '../../../widgets/auth/customtextformauth.dart';
import '../../../widgets/auth/customtexttitleauth.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // inject controller
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('Forget Password',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
          const CustomTextTitleAuth(text: "Check Email"),
          const SizedBox(height: 10),
          const CustomTextBodyAuth(
              text:
                  "please Enter Your Email Address To Recive A verification code"),
          const SizedBox(height: 15),
          CustonTextFormAuth(
            mycontroller: controller.email,
            hinttext: "Enter Your Email",
            iconData: Icons.email_outlined,
            labeltext: "Email",
            // mycontroller: ,
          ),
          // how we check and go to verifycode
          // by going to its page
          CustomButtomAuth(
              text: "Check",
              onPressed: () {
                // by asking backend if user has email on it
                // if found it send hem to verify code
                // it recive code on its email or phone

                controller.goToVerfiyCode();
              }),
          const SizedBox(height: 40),
        ]),
      ),
    );
  }
}
