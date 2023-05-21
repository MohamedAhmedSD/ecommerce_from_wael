import 'package:get/get.dart';

import '../core/constants/routes.dart';
import '../view/screen/auth/login.dart';
import '../view/screen/onboarding/onboarding.dart';

import 'core/middleware/mymiddleware.dart';
import 'view/screen/auth/other_features/forgetpassword/forgetpassword.dart';
import 'view/screen/auth/other_features/forgetpassword/resetpassword.dart';
import 'view/screen/auth/other_features/forgetpassword/success_resetpassword.dart';
import 'view/screen/auth/other_features/forgetpassword/verifycode.dart';
import 'view/screen/auth/other_features/success_signup.dart';
import 'view/screen/auth/other_features/verifycode_signup.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/language/language.dart';

//* flutter ordinary routes
// Map<String, Widget Function(BuildContext)> routes = {
//   //! ==================== [language] ====================
//   AppRoute.language: (context) => const Language(),

//   //! ==================== [onboarding] ====================
//   AppRoute.onBoarding: (context) => const OnBoardingPage(),

//   //! ==================== [auth] ====================
//   AppRoute.login: (context) => const Login(),
//   AppRoute.signUp: (context) => const SignUp(),
//   AppRoute.forgetPassword: (context) => const ForgetPassword(),
//   AppRoute.verfiyCode: (context) => const VerfiyCode(),
//   AppRoute.resetPassword: (context) => const ResetPassword(),
// };

//* Get routes, no need to use Get.delete with it

List<GetPage<dynamic>>? routes = [
  //! ==================== [language] ====================
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  //! ==================== [test pages] ====================
  //* test page to test our internet connection
  // GetPage(name: "/", page: () => const Test()),

  //* test page to test our data
  // GetPage(name: "/", page: () => const TestDataView()),
  //! ==================== [onboarding] ====================
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoardingPage()),
  //! ==================== [auth] ====================
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
];
