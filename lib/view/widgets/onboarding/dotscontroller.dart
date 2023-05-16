import 'package:flutter/material.dart';

import '../../../core/constants/color.dart';
import '../../../data/datasource/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //* use List.generate
        //* use => AnimatedContainer => decoration == to build or dots
        ...List.generate(
          onBoardingList.length,
          (index) => AnimatedContainer(
            margin: const EdgeInsets.only(right: 5),
            duration: const Duration(milliseconds: 900),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
