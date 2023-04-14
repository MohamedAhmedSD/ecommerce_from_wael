// we put this controller here to call on all app

import 'package:ecommerce_wael/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/apptheme.dart';

class LocaleController extends GetxController {
  //! An identifier used to select a user's language and formatting preferences.
  //? 1. make object from class
  Locale? language; //* we use it inside => onInit

  //? 2. call our servicres, by using => Get.find();
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

  //? 3. theme change, we make an object from ThemeData
  //* and give it default value
  ThemeData appTheme = themeEnglish;

  //? 4. we pass language code and save it in sharedprefs,
  //* by making method to do this

  changeLang(String langcode) {
    //! make object from Locale
    Locale locale = Locale(langcode);
    //? save your locale choose => inside sharedPref => by using services
    myServices.sharedPreferences.setString("lang", langcode);
    //* now theme change according lang, we write this line
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    //! apply it by Getx && update it
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  //! we use Getx life cycle, onInit == init
  @override
  void onInit() {
    //* get language value from sharedPrefs == String
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    //!  save both lang and theme on sharedprefs ==>
    if (sharedPrefLang == "ar") {
      //? save languahe on locale and theme
      language = const Locale("ar");
      // we need save theme with certain lang choose
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      //? if there another language => use that from device, with english theme
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
