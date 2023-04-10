import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constants/color.dart';

// class CustomButtonOnBoarding extends StatelessWidget {
//   const CustomButtonOnBoarding({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // from bottom
//       margin: const EdgeInsets.only(bottom: 30),
//       height: 40,
//       child: MaterialButton(
//           padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
//           textColor: Colors.white,
//           onPressed: () {},
//           color: AppColor.primaryColor,
//           child: const Text("Continue")),
//     );
//   }
// }

// using GetView => with generic controller => when no refresh on UI

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        textColor: Colors.white,
        onPressed: () {
          // controller to access
          // OnBoardingControllerImp get controller

          controller.next();
        },
        color: AppColor.primaryColor,
        child:  Text("8".tr), // "Continue"
      ),
    );
  }
}
