import 'package:ecommerce_wah/data/auth/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class SignUpController extends GetxController {
  //* 1. signUp process
  signUp();
  //* 2. nav into Sign in page
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  //? we write our code logic here, to separate logic from view
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  //? ================== [deal with TEC, and its life cycle] =================
  //* make our TextEditingController, that we need to when complete TFF
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  //* start life cycle of TEC
  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  //* end life cycle TEC
  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

//? ================ [signUp method] =================

  SignupData signupData = SignupData(Get.find());
  List data = [];

  //! [HINT] due to using late => I get alot of null errors
  //? and make me change code to recive only one paramaters rather than two
  //* so becarful in next time == 2 days for this reason !!!!

  // late StatusRequest statusRequest;
  // StatusRequest statusRequest = StatusRequest.none;

  //* we need use it on loading, it need initalize value
  //? so we change late into may null => ?

  StatusRequest? statusRequest;

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      //* we follow StatusRequest steps
      statusRequest = StatusRequest.loading;

      //! don't forget use update => to refresh UI
      update();

      //* save what back from testdata inside => response var
      var response = await signupData.postdata(
          username.text, password.text, email.text, phone.text);
      print("=============================== Controller $response ");

      statusRequest = handlingData(response);
      statusRequest = StatusRequest.success;

      update();
      //* when success
      if (response is Map && response.containsKey('status')) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);

          //* we need to pass email into verify page, so do that as Map
          Get.offNamed(AppRoute.verfiyCodeSignUp,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "ُWarning",
              middleText: "Phone Number Or Email Already Exists");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
    //* or
    //?==============================================================
    //    if (StatusRequest.success == statusRequest) {
    //     if (response['status'] == "success") {
    //       // data.addAll(response['data']);
    //       Get.offNamed(AppRoute.verfiyCodeSignUp);
    //     } else {
    //       Get.defaultDialog(title: "ُWarning" , middleText: "Phone Number Or Email Already Exists") ;
    //       statusRequest = StatusRequest.failure;
    //     }
    //   }
    //   update();
    // } else {}

    //?==============================================================
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }
}

/*
The error is caused by calling the `[]` method on an instance of the `StatusRequest` class. The `[]` method is not defined for this class and therefore cannot be called on instances of it. 

It seems that the error is occurring on the line where you are checking the value of the `status` field of the `response` variable returned from the `postdata` method. 

To fix the error, you will need to check if the `status` field exists in the `response` variable before trying to access it. You can do this by using the `containsKey` method. Here's an example:

```
if (response.containsKey('status')) {
  if (response['status'] == "success") {
    data.addAll(response['data']);
    Get.offNamed(AppRoute.verfiyCodeSignUp,
        arguments: {"email": email.text});
  } else {
    Get.defaultDialog(
        title: "ُWarning",
        middleText: "Phone Number Or Email Already Exists");
    statusRequest = StatusRequest.failure;
  }
}
```

This code checks if the `status` field exists in the `response` variable and only accesses it if it does.
 */

/**
 * The error message indicates that the app is being denied access to the `fastpipe` device on the `tmpfs` filesystem. This is most likely due to a permission issue that is preventing the app from accessing the device.

To fix this issue, you may need to adjust the app's permissions to allow it to access the device. This can be done by adding the appropriate permission to the app's manifest file. 

You can try adding the following permission to the app's `AndroidManifest.xml` file:

```
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
```

This permission allows the app to read external storage, which may include the `fastpipe` device on the `tmpfs` filesystem.

If the issue persists, you may need to check the device's security settings to ensure that the app has the necessary permissions to access the device.
 */
