import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/tests/test_data_onemethod.dart';


class TestOneController extends GetxController {
  TestDataOneMethod testData = TestDataOneMethod(Get.find());

  List data = [];

  getData() async {
    var response = await testData.getData();
    print("=============================== Controller $response ");
    if (response['status'] == "success") {
      data.addAll(response['data']);
    } else {
      return const Text("No data found");
    }

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
