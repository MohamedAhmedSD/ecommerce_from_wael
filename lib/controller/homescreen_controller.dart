import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/screen/homepage/home.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [Center(child: Text("Settings"))],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [Center(child: Text("Profile"))],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [Center(child: Text("Favorite"))],
    )
  ];

  List titlebottomappbar = ["home", "settings", "profile", "favorite"];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
