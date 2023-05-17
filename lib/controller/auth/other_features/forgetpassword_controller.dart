import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
// bito => workplace => https://alpha.bito.co/auth/login?red=ws&TgVDJu0YJT4YlTqJA6izLGwGbc7OispF5_nazrADdeQ=
import '../../../core/constants/routes.dart';

/// The ForgetPasswordControllerImp class is a concrete implementation of the abstract ForgetPasswordController class that contains methods for handling the user's actions.
abstract class ForgetPasswordController extends GetxController {
  checkemail();
  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  //
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  // TEC, when forget we need use your email to send a message
  late TextEditingController email;

  // empty
  /// The checkemail() method is responsible for verifying the user's email and ensuring it is valid.

  @override
  checkemail() {}

  // nan
  /// The goToVerfiyCode() method is responsible for navigating the user to the verification code page once the email is valid.

  @override
  goToVerfiyCode() {
    if (formstate.currentState!.validate()) {
      Get.offNamed(AppRoute.verfiyCode);
    } else {
      if (kDebugMode) {
        print("Not Valid");
      }
    }
  }

  // start
  /// The onInit() method is called when the controller is initialized and is used to instantiate the email TextEditingController so that the user can enter their email address.

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  // end
  /// Finally, the dispose() method is called when the controller is no longer needed and is used to dispose of the email TextEditingController.

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
