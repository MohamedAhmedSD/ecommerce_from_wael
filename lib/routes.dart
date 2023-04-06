import 'package:flutter/material.dart';

import 'core/constants/route.dart';
import 'view/screen/auth/login.dart';

// our routes, map take String == routeName and function return Widget
// don't forget add route to your main under home:
Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => const Login()
};
