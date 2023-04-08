import 'package:ecommerce_wael/core/localization/changed_local.dart';
import 'package:ecommerce_wael/core/localization/translation.dart';
import 'package:ecommerce_wael/core/services/services.dart';
import 'package:ecommerce_wael/routes.dart';
// import 'package:ecommerce_wael/view/screen/onboarding_new.dart';
// import 'package:ecommerce_wael/view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constants/color.dart';
import 'view/screen/language.dart';

// [day 2] => loginpage
// upgrade packages => flutter pub upgrade --major-versions
// its main folder are => core, data, controller, view

// we can search about ui inside website our google images
// then use screen shot to make our images
void main() async {
  // add services
  WidgetsFlutterBinding.ensureInitialized();
  // call its global function
  await initialServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
// inject our locale
  final LocaleController localeController = Get.put(LocaleController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslation(),
      // from controller, get lang
      locale: localeController.language,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "PlayfairDisplay",
        textTheme: const TextTheme(
            // to deal with all app text theme from here
            // go to place you want call it
            displayLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColor.black),
            bodyLarge: TextStyle(
                height: 2,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 17)),
        primarySwatch: Colors.blue,
      ),
      home: const Language(),
      // if you not call route => login not access
      routes: routes,
    );
  }
}
