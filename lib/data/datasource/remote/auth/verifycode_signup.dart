//! it is start point to deal with backend then make controller

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class VerifyCodeSignUpData {
  Crud crud;
  VerifyCodeSignUpData(this.crud);
  postdata(String email, String verifycode) async {
    // var response = await crud.postData(AppLink.signUp, {
    //![HINT] wrong link make error with backend
    var response = await crud.postData(AppLink.verifyCodeSignUp, {
      //* green from or [php]
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
