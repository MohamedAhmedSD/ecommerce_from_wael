import '../../core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  //* will use later when app run to assign certain data value on it.
  Locale? language;

  //* inject our services to use Sharedp to save our chooce
  MyServices myServices = Get.find();

  //* make method to change the language when press on btns

  changeLang(String languageCode) {
    //* pass language code to Locale
    Locale locale = Locale(languageCode);

    //* set lang inside shared preferences
    //* some apps may need also save language on remote db , but not necessarily
    myServices.sharedPreferences.setString("lang", languageCode);

    //! don't forget update locale
    Get.updateLocale(locale);
  }

  //* should run when app open
  @override
  void onInit() {
    super.onInit();

    //* make nullable String to make deal with code easily
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");

    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    } else {
      //* default value == use device language
      language = Locale(Get.deviceLocale!.languageCode);
    }
  }
}

//! [hint] : inject this controller on main file to used by all pages later