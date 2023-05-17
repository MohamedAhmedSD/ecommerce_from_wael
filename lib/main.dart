import 'package:ecommerce_wah/core/constants/color.dart';
import 'package:ecommerce_wah/core/constants/routes.dart';
import 'package:ecommerce_wah/view/screen/auth/login.dart';
import 'package:ecommerce_wah/view/screen/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/localization/translation.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //* call global method, that call our services
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: ThemeData(
        //* use custome font family
        fontFamily: 'PlayfairDisplay',
        textTheme: const TextTheme(
          //* it can use alot of attributes as headline,bodyText... on old versions
          //* or displayLarge ... on new versions
          displayLarge: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
          bodyLarge: TextStyle(
              height: 2,
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: AppColor.grey),
        ),
        primarySwatch: Colors.blue,
      ),
      //* translation
      translations: MyTranslation(),
      home: const OnBoardingPage(),
      getPages: [
        GetPage(name: AppRoute.login, page: () => const Login()),
      ],
    );
  }
}
