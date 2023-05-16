import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constants/color.dart';

//* no refresh on UI so use GetView() instead of StatelessWidget
class CustomButtonOnBoarding extends GetView<OnBoardingControllerImpl> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 30),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        textColor: Colors.white,
        color: AppColor.primaryColor,
        onPressed: () {
          //* call next method from => OnBoardingControllerImpl
          controller.next();
        },
        child: const Text("Contniue"),
      ),
    );
  }
}
