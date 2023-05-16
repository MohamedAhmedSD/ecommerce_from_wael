import 'package:ecommerce_wah/core/constants/routes.dart';
import 'package:ecommerce_wah/view/screen/auth/login.dart';
import 'package:flutter/material.dart';

//* ordinary routes
Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => const Login()
};
