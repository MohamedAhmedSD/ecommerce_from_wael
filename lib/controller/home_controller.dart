import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/home_data.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
}

class HomeControllerImp extends HomeController {
  //! to use SharedPrefs
  MyServices myServices = Get.find();

  String? username;
  // String? id;
  int? id;

  HomeData homedata = HomeData(Get.find());

  // List data = [];
  List categories = [];
  List items = [];
  // List items = [];

  //!!!!!!!!!!!!!!!!!!
  // late StatusRequest statusRequest;
  // StatusRequest? statusRequest;
  StatusRequest? statusRequest = StatusRequest.none;

  @override
  initialData() {
    //* get them from SP => by its key
    username = myServices.sharedPreferences.getString("username");
    // id = myServices.sharedPreferences.getString("id");
    id = myServices.sharedPreferences.getInt("id");
  }

  @override
  void onInit() {
    getdata();
    initialData();
    super.onInit();
  }

  //* I need use status to reach to its inner data
  //* so on backend I add status at its end
  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    statusRequest = StatusRequest.success;
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //! we need add certain data we need to use it
        //? as categories && items
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
