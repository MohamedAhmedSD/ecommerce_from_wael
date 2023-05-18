import 'package:get/get.dart';

//? to check value inside our text fields is it valid or not
//* we need 4 parameters => when call it, and use the 4th to check which
//* TFF we stand on it == type

validInput(String val, int min, int max, String type) {
  //? ================= [1] is it have certain value our not ===========================
  if (type == "username") {
    //* we make our type, to check TFF
    //! we use => GetUtils == Checks if data is null.

    //* Checks if string is a valid username.
    //? use certain built-in regex
    //* there are alot of check methods, read about them as isPdf....

    //? its regex ====================
    /// static bool isUsername(String s) =>
    /// hasMatch(s, r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$');
    if (!GetUtils.isUsername(val)) {
      //* better use opposite, so when condition false we
      //* execute what inside if condition
      return "not valid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone";
    }
  }

  //* =========== I add password == use username regex ===========
  if (type == "password") {
    if (!GetUtils.isUsername(val)) {
      return "not valid password";
    }
  }

  //? ================= [2] is it empty or not ===========================
  if (val.isEmpty) {
    return "can't be Empty";
  }
  //? ================= [3] enter only value between certain range ===========================
  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be larger than $max";
  }
}
