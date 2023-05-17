import 'package:ecommerce_wah/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;

  //* inject our services to use Sharedp to save our chooce
  MyServices myServices = Get.find();

  //* make method
  changeLang(String languageCode) {
    //* pass language code to Locale
    Locale locale = Locale(languageCode);
    //* set lang inside shared preferences
    myServices.sharedPreferences.setString("lang", languageCode);
    //! don't forget update locale
    Get.updateLocale(locale);
  }
}
