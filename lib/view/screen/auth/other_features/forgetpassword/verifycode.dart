import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../../controller/auth/other_features/verifycode_controller.dart';
import '../../../../../core/constants/color.dart';
import '../../../../widgets/auth/customtextbodyauth.dart';
import '../../../../widgets/auth/customtexttitleauth.dart';

//! we use package => flutter_otp_text_field

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //* DI
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('51'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
           CustomTextTitleAuth(text: "52".tr),
          const SizedBox(height: 10),
           CustomTextBodyAuth(
              text: "53".tr),
          const SizedBox(height: 15),
          //! otp ::::::::::::
          OtpTextField(
            fieldWidth: 50.0,
            borderRadius: BorderRadius.circular(20),
            numberOfFields: 5,
            borderColor: const Color(0xFF512DA8),
            //* set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //* runs when a code is typed in
            onCodeChanged: (String code) {
              //* handle validation or checks here
            },
            //* runs when every textfield is filled
            onSubmit: (String verificationCode) {
              controller.goToResetPassword();
            }, // end onSubmit
            // it have show alert proberty also
          ),
          const SizedBox(height: 40),
        ]),
      ),
    );
  }
}
