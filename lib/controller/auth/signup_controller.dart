import 'package:ecommerce_wah/data/auth/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constants/routes.dart';

abstract class SignUpController extends GetxController {
  //* 1. signUp process
  signUp();
  //* 2. nav into Sign in page
  goToSignIn();
}

//? ================ [signUp method] =================

//* 1. signUp process
// @override
// signUp() {
//   //* we need check is our fields vaild according our validators our not
//   //? determines it by using formstate
//   if (formstate.currentState!.validate()) {
//     Get.offNamed(AppRoute.verfiyCodeSignUp);
//     //* to avoid cache memory we need delete <controller> from memory
//     //? after nav me to next pge
//     //! so data will delete if I back to them

//     //! == if use flutter routes we need delete or lazyput to deal with cache memory ==
//     //* ======== we delete our controller ======
//     //* so when back to page it clear TFF
//     // Get.delete<SignUpControllerImp>();
//     //* or instead of use delete =>
//     //* we can use Get.lazyPut as inject on our page instead Get.put,
//     //? but we need to use GetBuilder to be able use controller
//   } else {
//     if (kDebugMode) {
//       print("Not Valid");
//     }
//   }
// }

class SignUpControllerImp extends SignUpController {
  //? we write our code logic here, to separate logic from view
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  //? ================== [deal with TEC, and its life cycle] =================
  //* make our TextEditingController, that we need to when complete TFF
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  // StatusRequest statusRequest = StatusRequest.none;

  SignupData signupData = SignupData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  @override
  signUp() async {
    // if (formstate.currentState!.validate()) {
    //* we follow StatusRequest steps
    statusRequest = StatusRequest.loading;
    //! don't forget use update
    // update();

    //* save what back from testdata inside => response var
    var response = await signupData.postdata(
        username.text, password.text, email.text, phone.text);
    print("=============================== Controller $response ");

    // statusRequest = handlingData(response);
    statusRequest = StatusRequest.success;

    // update();
    //* when success
    if (response is Map && response.containsKey('status')) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
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

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }
}

  

  //* start life cycle of TEC
  
  //* end life cycle TEC





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