import 'package:flutter/material.dart';

import '../../../core/constants/color.dart';
import '../../../data/datasource/static/static.dart';

/// make our dots, below PageView
class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
                  // margin to make space between dots
                  margin: const EdgeInsets.only(right: 5),
                  duration: const Duration(milliseconds: 900),
                  // size of dots
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ))
      ],
    );
  }
}
