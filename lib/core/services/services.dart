import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  //! we need call SharedPref
  // make them late
  late SharedPreferences sharedPreferences;

  //? make future function its generic
  // our services class, and init our services inside it
  Future<MyServices> init() async {
    // start services
    sharedPreferences = await SharedPreferences.getInstance();
    // end service
    return this; // this line solve nun-nullable eror
  }
}

// now we make global function,
//! to call our init services function
// then call it on main
initialServices() async {
  //! when we deal with async => we use => Get.putAsync(), to inject it
  await Get.putAsync(() => MyServices().init());
}
