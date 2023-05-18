import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constants/color.dart';
import '../../../data/datasource/static.dart';

//* D.injection => OnBoardingControllerImpl, use GetView<>
//! covert StatelessWidget into  GetView<>
//* no need to change my UI??
class CustomSlider extends GetView<OnBoardingControllerImpl> {
  const CustomSlider({super.key});
//! =========== [part of first page ] ===========
//? theme data not apply on it so we write it manually

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      //* it have onPageChanged attribute
      onPageChanged: (val) {
        //* print or current page index
        // print(val);
        //* access onboarding controller, use onPageChanged method
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          //? ========== try use same ratio of oraginal image =====
          Image.asset(
            "${onBoardingList[i].image}",
            // width: 200,
            // height: 230,
            //* make it responsive height
            height: Get.width / 1.3,
            fit: BoxFit.fill,
          ),
          //! [hint] no need to use sizedbox here
          const SizedBox(
            height: 50,
          ),
          Text(
            "${onBoardingList[i].title}",
            // style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //* use style from textTheme access as inheritance from Theme
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColor.black),
          ),
          //? ======== use alignment for Container && text =======
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "${onBoardingList[i].body}",
              textAlign: TextAlign.center,
              //* use style from textTheme access as inheritance from Theme
              // style: const TextStyle(
              //   height: 2,
              //   color: AppColor.grey,
              //   fontWeight: FontWeight.bold,
              //   fontSize: 17,
              // ),
              style: const TextStyle(
                  height: 2,
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
