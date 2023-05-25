import 'package:ecommerce_wah/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/other_features/forgetpassword/verfiycodesignup_controller.dart';
import '../../../../core/constants/color.dart';
import '../../../widgets/auth/customtextbodyauth.dart';
import '../../../widgets/auth/customtexttitleauth.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //* DI
    Get.put(VerifyCodeSignUpControllerImp());

    //! add loading => GetVuilder

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          // Verification Code
          title: Text('51'.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColor.grey)),
        ),
        body: GetBuilder<VerifyCodeSignUpControllerImp>(
          builder: (controller) =>
              //* add loading method here
              controller.statusRequest == StatusRequest.loading
                  ? const Center(child: Text("Loading"))
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: ListView(children: [
                        const SizedBox(height: 20),
                        // Check code
                        CustomTextTitleAuth(text: "52".tr),
                        const SizedBox(height: 10),
                        // Please Enter The Digit Code Sent To wael@gmail.com
                        CustomTextBodyAuth(text: "53".tr),
                        const SizedBox(height: 15),
                        //? =========== how we use OTP ===============
                        OtpTextField(
                          fieldWidth: 50.0,
                          borderRadius: BorderRadius.circular(20),
                          numberOfFields: 5,
                          borderColor: const Color(0xFF512DA8),
                          //* set to true to show as box or false to show as dash
                          showFieldAsBox: true,

                          //* runs when a code is typed in
                          onCodeChanged: (String code) {
                            //? handle validation or checks here
                          },

                          //*runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            controller.goToSuccessSignUp(verificationCode);
                          }, // end onSubmit
                        ),
                        const SizedBox(height: 40),
                      ]),
                    ),
        ));
  }
}
