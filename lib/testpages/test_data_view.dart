import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/test/test_data.controller.dart';
import '../controller/test/test_datasecond_controller.dart';
import '../core/class/handling_dataviewsecond.dart';
import '../core/constants/color.dart';

//! [old]
// class TestDataView extends StatelessWidget {
//   const TestDataView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //* DI
//     Get.put(TestDataController());
//     return Scaffold(
//       appBar: AppBar(title: const Text('Title')),
//       body: GetBuilder<TestDataController>(
//         builder: (controller) {
//           if (controller.statusRequest == StatusRequest.loading) {
//             return const Center(child: Text("Loading..."));
//           } else if (controller.statusRequest == StatusRequest.offlinefailure) {
//             return const Center(child: Text("offlinefailure..."));
//           } else if (controller.statusRequest == StatusRequest.serverfailure) {
//             return const Center(child: Text("serverfailure..."));
//           } else if (controller.statusRequest == StatusRequest.failure) {
//             //* when no data or wrong data
//             return const Center(child: Text("No Data..."));
//           } else {
//             return ListView.builder(
//                 itemCount: controller.data.length,
//                 itemBuilder: (contet, index) {
//                   return Text('${controller.data}');
//                 });
//           }
//         },
//       ),
//     );
//   }
// }

// //! [new]
class TestDataView extends StatelessWidget {
  const TestDataView({super.key});

  @override
  Widget build(BuildContext context) {
    // Dependency Injection: creates a TestDataController instance and registers it in the GetX abstraction layer
    Get.put(TestDataController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
        backgroundColor: AppColor.primaryColor, // Sets the app bar color
      ),
      body: GetBuilder<TestDataController>(
        builder: (controller) {
          // Uses the HandlingDataView widget to display data based on the status of the request
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              // Builds a ListView using the data from the controller
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Text("${controller.data}");
              },
            ),
          );
        },
      ),
    );
  }
}
