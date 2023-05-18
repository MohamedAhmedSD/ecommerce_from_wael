import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/routes.dart';
import '../services/services.dart';

//* we use MiddleWare with SharedP to skip both Languages and onboarding pages
class MyMiddleWare extends GetMiddleware {
  //* 1. priority
  @override
  int? get priority => 1;

  //* 2. MyServices
  MyServices myServices = Get.find();

  //* 3. RouteSettings
  //* the key is user see all onboarding or not ??
  //? by add my services to onboarding controller and call it here also
  //* in onboarding controller => setString value to use it here
  //* in RouteSettings, through getString
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("onboarding") == "1") {
      //* nav to Login
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}
