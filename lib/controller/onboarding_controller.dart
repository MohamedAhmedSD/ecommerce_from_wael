import 'package:flutter/material.dart';
import 'package:get/get.dart';

//* we need blueprints for what method we will be needed > use abstract
abstract class OnBoardingController extends GetxController {
  //* 1. go to next page when press on btn
  next();
  //* 2.when pageview move => interact, it need parameter
  onPageChanged(int index);
}

//* implement from abstract
class OnBoardingControllerImpl extends OnBoardingController {
  //* var to
  int currentPage = 0;

  //*
  late PageController pageController;

  //* go to next page when press on => continue btn
  @override
  next() {
    //! don't forget ++; or you stuck on first page
    currentPage++;
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 900), curve: Curves.ease);
  }

  //* when page slide
  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  //* init our pageController => to avoid error it not initialized
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }
}

//* inject both => onBoarding page,
