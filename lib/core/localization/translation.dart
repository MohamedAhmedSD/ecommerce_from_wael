import 'package:get/get.dart';

//* make simple Translation whitch extends from Translations class
class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {"1": "اختر اللغة"},
        "en": {'1': 'Choose Language'}
      };
}
