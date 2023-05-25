import 'package:ecommerce_wah/core/class/crud_adjust.dart';
import 'package:ecommerce_wah/core/class/crud.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    //* Tests:-
    //! don't forget fenix
    // Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.put(CrudOne());

    //* ou
        Get.put(Crud());

  }
}
