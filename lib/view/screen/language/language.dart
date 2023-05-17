import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/localization/localecontroller.dart';
import '../../widgets/language/custombuttonlang.dart';

//* use GetView to use injected LocalController
class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      //* use padding to make the btn
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            // "Choose Language",
            "1".tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          //? some time if not write onPressed: () {},
          //* btn not appear on screen
          CustomButtonLang(
            textbutton: 'Ar',
            //! [not good practice to write method here, but it small code]
            onPressed: () {
              controller.changeLang("ar");
              //! [better] : when nav no way to back to this page
              Get.offNamed("AppRoute.onBoarding");
            },
          ),
          CustomButtonLang(
            textbutton: 'En',
            //! [not good practice to write method here, but it small code]
            onPressed: () {
              controller.changeLang("en");
              //! [better] : when nav no way to back to this page
              Get.offNamed("AppRoute.onBoarding");
            },
          ),
        ],
      ),
    ));
  }
}
