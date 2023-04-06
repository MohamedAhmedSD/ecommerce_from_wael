import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/constants/route.dart';
import '../data/datasource/static/static.dart';

// make abstract class, contain 2 methods
abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

// we access our abstract from its impl
class OnBoardingControllerImp extends OnBoardingController {
  // we make PageController => we use it later onchanged at pageView
  late PageController pageController;

  int currentPage = 0;

  // how we move according currentPage
  @override
  next() {
    // go to next from 0 to ...
    currentPage++;

    // when reach to last => go to login pagr
    // from our static data
    // lenght start from 1, index from 0
    if (currentPage > onBoardingList.length - 1) {
      // go to next and delete all previeus screens
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

// to know where we are => when use pageView
// it take value pass through it and assign it into
// currentPage
  @override
  onPageChanged(int index) {
    currentPage = index;
    update(); // need it with getbuilder
  }

// call pageController => when screen open => onInit
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
