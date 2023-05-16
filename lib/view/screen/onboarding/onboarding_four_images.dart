import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../widgets/onboarding/custombtn.dart';
import '../../widgets/onboarding/customslider.dart';
import '../../widgets/onboarding/dotscontroller.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    //* D.injection => OnBoardingControllerImpl
    Get.put(OnBoardingControllerImpl());

    return Scaffold(
      //* change BG color
      // backgroundColor: AppColor.grey,
      body: SafeArea(
        //* we need 2 parts, fixed and moveable part
        //? ===============[part 1] moveable part ========================
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: CustomSlider(),
            ),
            //? ===============[part 2] fixed part ========================
            //! we add both dots and spaces btn inside a column, which it
            //* inside Expanded

            Expanded(
              flex: 1,
              child: Column(
                children: const [
                  //* ================ dots =======================
                  //* they are row of dots ==
                  CustomDotControllerOnBoarding(),
                  Spacer(
                    flex: 2,
                  ),
                  //* ================ BTN =======================
                  CustomButtonOnBoarding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
