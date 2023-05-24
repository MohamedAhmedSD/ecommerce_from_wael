//! it is start point to deal with backend then make controller

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

// class LoginData {
//   Crud crud;
//   LoginData(this.crud);
//   //?============================================================
//   //! any orgnaization error => not match with order of backend
//   //* ================ so becarfull ==========================
//   postdata(String email, String password) async {
//     var response = await crud.postData(AppLink.login, {
//       //! give me wrong email when use password first =========
//       "email": email,
//       "password": password,
//     });
//     return response.fold((l) => l, (r) => r);
//   }
// }

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(String email, String password) async {
    var response = await crud
        .postData(AppLink.login, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
