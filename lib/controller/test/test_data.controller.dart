import 'package:ecommerce_wah/core/class/statusrequest.dart';
import 'package:ecommerce_wah/core/functions/handlingdatacontroller.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/test_data.dart';

class TestDataController extends GetxController {
  //* it required Crud object
  //? we need avoid make instance from object every time so we use bindings
  //* to create it once, use Get.find()
  // TestData testData = TestData(crud);
  TestData testData = TestData(crud: Get.find());

  List data = [];

  late StatusRequest statusRequest;

  //* not same to that in
  getData() async {
    //* we follow StatusRequest steps
    statusRequest = StatusRequest.loading;
    //* save what back from testdata inside => response var
    var response = await testData.getData();
    //! [error] _TypeError (type 'Null' is not a subtype of type 'StatusRequest')
    //? error due to we not use return  
    print("================================== Controller $response");
    statusRequest = handlingData(response);
    //* when success
    if (StatusRequest.success == statusRequest) {
      data.addAll(response['data']);
    }
    //! don't forget update
    update();
  }

  //* run it
  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
