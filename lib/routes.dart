import 'package:ecommerce_wael/test.dart';
import 'package:ecommerce_wael/view/screen/onboarding.dart';
import 'package:ecommerce_wael/view/screen/onboarding_new.dart';
import 'package:flutter/material.dart';

import 'core/constants/route.dart';
import 'view/screen/auth/forgetpassword/forgetpassword.dart';
import 'view/screen/auth/forgetpassword/resetpassword.dart';
import 'view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'view/screen/auth/forgetpassword/verifycode.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/auth/success_signup.dart';
import 'view/screen/auth/verifycode_signup.dart';

//! our routes, map take String == Widget form from =>
//? routeName and function return Widget
//* (context) => const Login(),

//! don't forget add routes to your main file under home:,
// to use them as routs for your application
Map<String, Widget Function(BuildContext)> routes = {
  // GetPage(name: "/", page: () => const Language() , middlewares: [
  //   MyMiddleWare()
  // ]),
  // GetPage(name: "/", page: () => TestView()),
  // test, internet connection
  AppRoute.test: (context) => const Test(),

  // Auth
  AppRoute.login: (context) => const Login(),
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.forgetPassword: (context) => const ForgetPassword(),
  AppRoute.verfiyCode: (context) => const VerfiyCode(),
  AppRoute.resetPassword: (context) => const ResetPassword(),
  AppRoute.successResetpassword: (context) => const SuccessResetPassword(),
  AppRoute.successSignUp: (context) => const SuccessSignUp(),
  AppRoute.verfiyCodeSignUp: (context) => const VerfiyCodeSignUp(),

  // OnBoarding
  AppRoute.onBoarding: (context) => const OnBoarding(),
  AppRoute.onBoardingnew: (context) => const OnBoardingNew(),
};
