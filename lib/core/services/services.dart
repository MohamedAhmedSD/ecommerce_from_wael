//* create services to call what we need to use it when start using our app

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  //? What we need to call ??
  //* to call SharedP
  late SharedPreferences sharedPreferences;

  //? make method to initialize the Services as shared preferences
  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();

    //! [hint] use return this; at end, to avoid null return error
    return this;
  }
}

//* Make global method that use DI to your initialize Service method on it
//* our use Get.find() method
initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
