import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/auth/other_features/forgetpassword/resetpassword_controller.dart';
import '../../../../../core/constants/color.dart';
import '../../../../../core/functions/validinput.dart';
import '../../../../widgets/auth/custombuttonauth.dart';
import '../../../../widgets/auth/customtextbodyauth.dart';
import '../../../../widgets/auth/customtextformauth.dart';
import '../../../../widgets/auth/customtexttitleauth.dart';

//? after verify code done
//* we send him to reset its pw

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //* DI
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('ResetPassword',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
            const SizedBox(height: 20),
            CustomTextTitleAuth(text: "35".tr),
            const SizedBox(height: 10),
            CustomTextBodyAuth(text: "35".tr),
            const SizedBox(height: 15),
            CustomTextFormAuth(
              isNumber: false,
              valid: (val) {
                return validInput(val!, 3, 40, "password");
              },
              mycontroller: controller.password,
              hinttext: "13".tr,
              iconData: Icons.lock_outline,
              labeltext: "19".tr,
            ),
            CustomTextFormAuth(
              isNumber: false,
              valid: (val) {
                return validInput(val!, 3, 40, "password");
              },
              mycontroller: controller.repassword,
              hinttext: "Re ${"13".tr}",
              iconData: Icons.lock_outline,
              labeltext: "19".tr,
            ),
            CustomButtonAuth(
                text: "33".tr,
                onPressed: () {
                  controller.goToSuccessResetPassword();
                }),
            const SizedBox(height: 40),
          ]),
        ),
      ),
    );
  }
}

//! [we need method ] to check is 2 passwords are same