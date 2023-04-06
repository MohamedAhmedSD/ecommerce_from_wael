import 'package:flutter/material.dart';

import 'core/constants/route.dart';
import 'view/screen/auth/login.dart';

// our routes, map take String == routeName and function return Widget
Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => const Login()
};
