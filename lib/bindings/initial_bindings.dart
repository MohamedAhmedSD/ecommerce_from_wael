import 'package:ecommerce_wah/core/class/crud.dart';
import 'package:get/get.dart';

import '../controller/auth/signup_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    //! don't forget fenix
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.put(Crud());
  }
}
