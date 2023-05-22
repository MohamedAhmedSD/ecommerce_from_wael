//! it is start point to deal with backend then make controller

import 'package:ecommerce_wah/core/class/crud_adjust.dart';

import '../../../../linkapi.dart';


class SignupDataOneMethod {
  CrudOne crud;
  SignupDataOneMethod(this.crud);
  postdata(String username, String password, String email, String phone) async {
    var response = await crud.postData(AppLink.signUp, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response;
  }
}
