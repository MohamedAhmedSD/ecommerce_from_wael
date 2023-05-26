import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/screen/homepage/home.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  //* to control on how page change when nav

  int currentpage = 0;

  //* list of our screens
  List<Widget> listPage = [
    const HomePage(),
    //? as test screen == not build yet
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

  //* titles, on seprate list but on same orders of screen
  List titlebottomappbar = ["home", "settings", "profile", "favorite"];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
