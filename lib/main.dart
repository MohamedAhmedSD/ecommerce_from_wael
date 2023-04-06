import 'package:ecommerce_wael/routes.dart';
import 'package:ecommerce_wael/view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// [day 1]
// upgrade packages => flutter pub upgrade --major-versions
// its main folder are => core, data, controller, view

// we can search about ui inside website our google images
// then use screen shot to make our images
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnBoarding(),
      // if you not call route => login not access
      routes: routes,
    );
  }
}
