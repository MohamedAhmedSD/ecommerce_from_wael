import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/test/test_onemethod_controller.dart';
import '../core/constants/color.dart';

class TestDataView extends StatelessWidget {
  const TestDataView({super.key});

  @override
  Widget build(BuildContext context) {
    // Dependency Injection: creates a TestDataController instance and registers it in the GetX abstraction layer
    Get.put(TestOneController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
        backgroundColor: AppColor.primaryColor, // Sets the app bar color
      ),
      body: GetBuilder<TestOneController>(
        builder: (controller) {
          // Uses the HandlingDataView widget to display data based on the status of the request
          return ListView.builder(
            // Builds a ListView using the data from the controller
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return Text("${controller.data}");
            },
          );
        },
      ),
    );
  }
}
