import 'package:get/get.dart';

//* we need blueprints for what method we will be needed > use abstract
abstract class OnBoardingController extends GetxController {
  //* 1. go to next page when press on btn
  next();
  //* 2.when pageview move => interact, it need parameter
  onPageChanged(int index);
}
