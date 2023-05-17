import '../core/constants/routes.dart';
import '../view/screen/auth/login.dart';
import '../view/screen/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

import 'view/screen/auth/other_features/forgetpassword/forgetpassword.dart';
import 'view/screen/auth/other_features/forgetpassword/resetpassword.dart';
import 'view/screen/auth/other_features/forgetpassword/verifycode.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/language/language.dart';

//* ordinary routes
Map<String, Widget Function(BuildContext)> routes = {
  //! ==================== [language] ====================
  AppRoute.language: (context) => const Language(),

  //! ==================== [onboarding] ====================
  AppRoute.onBoarding: (context) => const OnBoardingPage(),

  //! ==================== [auth] ====================
  AppRoute.login: (context) => const Login(),
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.forgetPassword: (context) => const ForgetPassword(),
  AppRoute.verfiyCode: (context) => const VerfiyCode(),
  AppRoute.resetPassword: (context) => const ResetPassword(),
};
