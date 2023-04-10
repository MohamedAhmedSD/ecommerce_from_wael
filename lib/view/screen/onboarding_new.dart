import 'package:ecommerce_wael/core/constants/color.dart';
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
        // backgroundColor: Colors.white,
        backgroundColor: AppColor.backgroundcolor,
        body: SafeArea(
          child: Column(children: [
            const Expanded(
              flex: 4,
              child: CustomSliderOnBoardingTwo(),
            ),
            // me
            // Column(
            //   children: const [
            //     CustomDotControllerOnBoarding(),
            //     // Spacer(flex: 2),
            //     SizedBox(
            //       height: 8.0,
            //     ),
            //     CustomButtonOnBoarding()
            //   ],
            // ),
            Expanded(
              flex: 1,
              child: Column(
                children: const [
                  CustomDotControllerOnBoarding(),
                  Spacer(flex: 2),
                  CustomButtonOnBoarding()
                ],
              ),
            )
          ]),
        ));
  }
}

// from ai
class OnBoardingNewAi extends StatelessWidget {
  const OnBoardingNewAi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // to access controller from any place
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: const CustomSliderOnBoardingTwo(),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    CustomDotControllerOnBoarding(),
                    Spacer(flex: 2),
                    CustomButtonOnBoarding()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
