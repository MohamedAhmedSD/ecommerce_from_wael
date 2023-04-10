import 'package:ecommerce_wael/core/constants/route.dart';
import 'package:ecommerce_wael/core/localization/changed_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/language/custom_btn_lang.dart';
// use GetView with its generic instead stl

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "1".tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButtonLang(
            textbutton: 'Ar',
            onPressed: () {
              // GitView controller == controller
              controller.changeLang("ar");
              // no back
              // Get.offNamed(AppRoute.onBoarding);
              // or //
              // if we nedd make user able back to language
              // to change it from here er use
              Get.toNamed(AppRoute.onBoarding);
            },
          ),
          CustomButtonLang(
            textbutton: 'En',
            onPressed: () {
              controller.changeLang("en");
              // no back
              Get.offNamed(AppRoute.onBoarding);
              // or //
              Get.toNamed(AppRoute.onBoarding);
            },
          ),
        ]),
      ),
    );
  }
}
