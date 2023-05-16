import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constants/color.dart';
import '../../../data/datasource/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    //* we need conect them with controller with ability to change UI
    return GetBuilder<OnBoardingControllerImpl>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //* use List.generate
          //* use => AnimatedContainer => decoration == to build or dots
          ...List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 5),
              duration: const Duration(milliseconds: 900),
              //* use controller to change size of dots
              width: controller.currentPage == index ? 20 : 5,
              height: 6,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}
