import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding_controller.dart';
// import '../../core/constants/color.dart';
// import '../../data/datasource/static/static.dart';
import '../widgets/onboarding/custom_button.dart';
import '../widgets/onboarding/custom_slider_onboarding_slider_three_images.dart';
import '../widgets/onboarding/dot_controller.dart';

class OnBoardingNew extends StatelessWidget {
  const OnBoardingNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // to access controller from any place
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            const Expanded(
              flex: 4,
              child: CustomSliderOnBoardingTwo(),
            ),
            Column(
              children: const [
                CustomDotControllerOnBoarding(),
                // Spacer(flex: 2),
                SizedBox(
                  height: 8.0,
                ),
                CustomButtonOnBoarding()
              ],
            )
          ]),
        ));
  }
}
