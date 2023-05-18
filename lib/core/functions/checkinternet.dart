import 'dart:io';

//* back true or false => test method first on test page, use emulator is better
checkInternet() async {
  //* may use package
  //* internet_connection_checker: ^1.0.0+1
  try {
    // test with google
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      //* it not empty and first of address list not empty
      return true;
    }
  }
  //* may user not connected to internet => ask about > SocketException
  on SocketException catch (_) {
    return false; // no connection
  }
}
