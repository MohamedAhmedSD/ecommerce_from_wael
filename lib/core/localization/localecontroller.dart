import '../../core/services/services.dart';
import '../../core/constants/apptheme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  // //* will use later when app run to assign certain data value on it.
  // Locale? language;

  // //* inject our services to use Sharedp to save our chooce
  // MyServices myServices = Get.find();

  // //* make method to change the language when press on btns

  // changeLang(String languageCode) {
  //   //* pass language code to Locale
  //   Locale locale = Locale(languageCode);

  //   //* set lang inside shared preferences
  //   //* some apps may need also save language on remote db , but not necessarily
  //   myServices.sharedPreferences.setString("lang", languageCode);

  //   //! don't forget update locale
  //   Get.updateLocale(locale);
  // }

  // //* should run when app open
  // @override
  // void onInit() {
  //   super.onInit();

  //   //* make nullable String to make deal with code easily
  //   String? sharedPrefLang = myServices.sharedPreferences.getString("lang");

  //   if (sharedPrefLang == "ar") {
  //     language = const Locale("ar");
  //   } else if (sharedPrefLang == "en") {
  //     language = const Locale("en");
  //   } else {
  //     //* default value == use device language
  //     language = Locale(Get.deviceLocale!.languageCode);
  //   }
  // }

  //?=========================== new =====================================
  //! An identifier used to select a user's language and formatting preferences.
  //? 1. make object from class
  Locale? language; //* we use it inside => onInit

  //? 2. call our servicres, by using => Get.find();
  MyServices myServices = Get.find();

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
      //* we need save theme with certain lang choose
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

//! [hint] : inject this controller on main file to used by all pages later