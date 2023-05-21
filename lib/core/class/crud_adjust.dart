import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../functions/checkinternet.dart';

class CrudAtring {
  Future<Either<String, Map<String, dynamic>>> postData(
      String url, Map<String, dynamic> data) async {
    // Checks for internet connection
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(url), body: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        return Right(responseBody);
      } else {
        return const Left("Server failure");
      }
    } else {
      return const Left("No internet connection");
    }
  }
}

/// In this rewritten code, we replaced `StatusRequest` with a `String`
///  for server and offline errors. We also removed the `import` statement for
/// `StatusRequest` and the `class` for `StatusRequest` itself.
///  The return type for `postData` has been updated to reflect the change
///  in type for the successful response. Finally, we updated the `Map`
/// type to `Map<String, dynamic>` to ensure the proper decoding of JSON responses.
///
///
///

class CrudOne {
  Future<Map<String, dynamic>> postData(
      String url, Map<String, dynamic> data) async {
    // Checks for internet connection
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(url), body: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        return responseBody;
      }
    }
    return {}; // Return an empty `Map` by default
  }
}

// In this updated code, we removed the usage of `Either` and only return
//a `Map<String, dynamic>`. Also, in case of errors or no internet connection,
// we are returning an empty `Map` by default.
