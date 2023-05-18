import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/color.dart';

//* function to solve back problem
Future<bool> alertExitApp() {
  //? Get.defaultDialog ===================

  Get.defaultDialog(
      title: "47".tr,
      titleStyle: const TextStyle(
          color: AppColor.primaryColor, fontWeight: FontWeight.bold),
      middleText: "48".tr,

      //* make two btns
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              //! ========== close app ==============
              exit(0);
            },
            child: Text("49".tr)),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              Get.back();
            },
            child: Text("50".tr))
      ]);

  //* Creates a future completed with [value].
  return Future.value(true);
}
