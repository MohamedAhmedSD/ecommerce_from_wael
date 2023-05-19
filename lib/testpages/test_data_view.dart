import 'package:ecommerce_wah/controller/test/test_data.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';

class TestDataView extends StatelessWidget {
  const TestDataView({super.key});

  @override
  Widget build(BuildContext context) {
    //* DI
    Get.put(TestDataController());
    return Scaffold(
      appBar: AppBar(title: const Text('Title')),
      body: GetBuilder<TestDataController>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return const Center(child: Text("Loading..."));
          } else if (controller.statusRequest == StatusRequest.offlinefailure) {
            return const Center(child: Text("offlinefailure..."));
          } else if (controller.statusRequest == StatusRequest.serverfailure) {
            return const Center(child: Text("serverfailure..."));
          } else {
            return ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (contet, index) {
                  return Text('${controller.data}');
                });
          }
        },
      ),
    );
  }
}
