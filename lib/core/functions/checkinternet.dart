import 'dart:io';
import 'package:http/http.dart' as http;

checkInternet() async {
  // may use package
  // internet_connection_checker: ^1.0.0+1
  try {
    // test with google
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true; // it not empty and first of address list not empty
    }
    // may user not connected to internet => ask about > SocketException
  } on SocketException catch (_) {
    return false; // no connection
  }
}

// test it on test page

Future<bool> hasNetwork() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}

Future<bool> hasNetwork2() async {
  try {
    final result = await http.get(Uri.parse('www.google.com'));
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}
