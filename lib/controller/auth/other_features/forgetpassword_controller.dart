import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/constants/routes.dart';


abstract class ForgetPasswordController extends GetxController {
  //* 1. checkemail process
  checkemail();
  //* 2. nav into goToVerfiyCode page
  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  //? ================== [deal with TEC, and its life cycle] =================
  //* make our TextEditingController, that we need to when complete TFF
  //* TEC, when forget your data, we need use your email to send a message
  late TextEditingController email;

  //* start live cycle TEC
  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  //* end live cycle TEC
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  //? ================ [checkemail method] =================
  @override
  checkemail() {}

  //? ================ [nav methods] =================
  @override
  goToVerfiyCode() {
    Get.offNamed(AppRoute.verfiyCode);
  }
}
