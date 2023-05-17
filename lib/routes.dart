import '../core/constants/routes.dart';
import '../view/screen/auth/login.dart';
import '../view/screen/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

import 'view/screen/language/language.dart';

//* ordinary routes
Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => const Login(),
  AppRoute.language: (context) => const Language(),
  AppRoute.onBoarding: (context) => const OnBoardingPage(),
};
