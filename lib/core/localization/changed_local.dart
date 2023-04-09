// we put this controller here to call on all app

import 'package:ecommerce_wael/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/apptheme.dart';

class LocaleController extends GetxController {
  // An identifier used to select a user's language and formatting preferences.
  // make object from class
  Locale? language;

  // call our servicres
  MyServices myServices = Get.find();

  // make the method
  // changeLang(String langcode) {
  //   // we pass lang code and save it in sharedprefs
  //   Locale locale = Locale(langcode);
  //   myServices.sharedPreferences.setString("lang", langcode);
  //   // don't forget update your choose
  //   Get.updateLocale(locale);
  // }

  // life cycle
  // @override
  // void onInit() {
  //   // start
  //   // easy use var to deal with data
  //   // it getString not set
  //   String? sharedPrefLang = myServices.sharedPreferences.getString("lang");

  //   // use defaultDevice lang, with abilty to user change it to favorite one
  //   if (sharedPrefLang == "ar") {
  //     // langayge == Locale
  //     language = const Locale("ar");
  //   } else if (sharedPrefLang == "en") {
  //     language = const Locale("en");
  //   } else {
  //     // non-nullable
  //     language = Locale(Get.deviceLocale!.languageCode);
  //   }
  //   super.onInit();
  // }

  // new

  // theme change
  ThemeData appTheme = themeEnglish;

  //
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    // theme change according lang
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    // apply it by Getx
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    //  save lang and theme on sharedprefs
    if (sharedPrefLang == "ar") {
      // save lang
      language = const Locale("ar");
      // we need save theme with certain lang choose
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
