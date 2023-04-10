import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoardingTwo extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoardingTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // we use PageView.builder =>
    return PageView.builder(
        // use controller, we need
        controller: controller.pageController,
        onPageChanged: (val) {
          // we call function from our controller and give it value above
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                // const SizedBox(height: 80),
                Image.asset(
                  onBoardingList[i].image!,
                  // width: 200,
                  // height: 230,
                  // fit: BoxFit.fill,
                  // use grtx to make same size of image
                  height: Get.width / 1.3,
                  fit: BoxFit.fill,
                ),
                // const SizedBox(height: 80),
                Text(
                  onBoardingList[i].title!,
                  // style: const TextStyle(
                  //     fontWeight: FontWeight.bold, fontSize: 22),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onBoardingList[i].body!,
                    textAlign: TextAlign.center,
                    // style: const TextStyle(
                    //     height: 2,
                    //     color: AppColor.grey,
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 14),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ));
  }
}
