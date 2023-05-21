import 'package:ecommerce_wah/core/class/statusrequest.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/test_data.dart';

// * In Flutter, this code defines a class named TestDataController
//* which extends the GetxController class.
//* The class connects the view with the logic necessary to get data from an API.

class TestDataController extends GetxController {
  //* it required Crud object
  //? we need avoid make instance from object every time so we use bindings
  //* to create it once, use Get.find()

  //* The TestData class is used to send a request to the API to get the data.
  //* The data returned from the API is stored in the List data.
  TestData testData = TestData(Get.find());

  List data = [];

  //* The class uses the StatusRequest class to control the status of the
  //* data transfer process.
  //* It also uses the handlingData() method to handle the response from the API,
  //* which is called in the getData() method.

  late StatusRequest statusRequest;

  //* not same to that in
  getData() async {
    //* we follow StatusRequest steps
    statusRequest = StatusRequest.loading;

    //* save what back from testdata inside => response var
    var response = await testData.getData();

    //! [error] _TypeError (type 'Null' is not a subtype of type 'StatusRequest')
    //? error due to we not use return with folds statements

    print("================================== Controller $response");
    // statusRequest = handlingData(response);
    statusRequest = StatusRequest.success;

    //* when success
    if (StatusRequest.success == statusRequest) {
      //* If the status of the data retrieval is success and the response from
      //* the API has a "status" key, the data is stored in the data list.
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        //* If the status of the data retrieval is a failure,
        //* the statusRequest is changed to a failure status.
        statusRequest = StatusRequest.failure;
      }
    }
    //! don't forget update
    //* This value is updated in the view through the update method,
    //* allowing the view to be updated accordingly.
    update();
  }

  //* The onInit() method is used to start the data retrieval process,
  //* calling the getData() method. The update() method is called
  //* to notify the view that the data has been retrieved.

  //* to run it
  @override
  void onInit() {
    super.onInit();
    getData();
  }
}

//! [chatGpt] => rewrite a code and improve it with explain it in steps by using comments

// 1- Import necessary libraries

// 2- Create a TestController class and extend it with GetxController
class TestController extends GetxController {
  // 3- Create an instance of TestData class and initialize an empty data list
  TestData testData = TestData(Get.find());
  List data = [];

  // 4- Declare a statusRequest variable to handle the status of API request
  late StatusRequest statusRequest;

  // 5- Create a getData function to request data from API
  getData() async {
    // 6- Set the statusRequest variable to Loading before making the API request
    statusRequest = StatusRequest.loading;

    // 7- Call the getData function from the testData object to make a request to the API
    var response = await testData.getData();

    //8- Print response from the API for debugging purposes
    print("=============================== Controller $response ");

    // 9- Set the statusRequest variable to the appropriate status according to the response
    statusRequest = handlingData(response);

    // 10- If the statusRequest is success, check the 'status' key in the response to see if it is 'success'.
    // 11- If it is, add the data to the data list. If not, set the statusRequest to failure.
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    // 12- Update the view to reflect the new status and data
    update();
  }

  //13- Use the onInit function to call the getData function when the class is initialized
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
