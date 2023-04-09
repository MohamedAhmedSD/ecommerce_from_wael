import 'package:ecommerce_wael/view/screen/onboarding.dart';
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


// our routes, map take String == routeName and function return Widget
// don't forget add route to your main under home:
Map<String, Widget Function(BuildContext)> routes = {
  // Auth
  AppRoute.login: (context) => const Login(),
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.forgetPassword: (context) => const ForgetPassword(),
  AppRoute.verfiyCode: (context) => const VerfiyCode(),
  AppRoute.resetPassword: (context) => const ResetPassword(), 
  AppRoute.successResetpassword: (context) => const SuccessResetPassword(),
  AppRoute.successSignUp: (context) => const SuccessSignUp(),
  // OnBoarding
  AppRoute.onBoarding: (context) => const OnBoarding(),
  AppRoute.verfiyCodeSignUp: (context) => const VerfiyCodeSignUp(),
};
