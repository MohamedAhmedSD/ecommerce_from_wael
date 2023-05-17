import 'package:get/get.dart';

// to check value inside our text fields
// we need 3 parameters =>
validInput(String val, int min, int max, String type) {
  // [1] is it have value our not
  if (type == "username") {
    // we make our type
    // we use => GetUtils.
    // better use opposite, so when condition false we
    // execute what inside if condition
    if (!GetUtils.isUsername(val)) {
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

  // no way to be empty
  if (val.isEmpty) {
    return "can't be Empty";
  }

  // [3] enter only value between certain range
  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be larger than $max";
  }
}
