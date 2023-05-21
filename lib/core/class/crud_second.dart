import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../functions/checkinternet.dart';
import 'statusrequest.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      final response = await http.post(Uri.parse(linkurl), body: data);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responsebody = jsonDecode(response.body);
        return right(responsebody);
      } else {
        return left(StatusRequest.serverfailure);
      }
    } else {
      return left(StatusRequest.offlinefailure);
    }
  }
}

/*

Steps :

1. The code imports necessary libraries to handle the HTTP requests, 
decode JSON values, and use Either to handle values that might fail.

2. A class is created with a method that will post data to the API. 
The method is named postData.

3. The postData method checks if the device has internet access 
by using the checkInternet function. 

4. Using the http.post method from the http library, the method sends 
an HTTP POST request to the URL provided, with the data passed as the request body.

5. If the response status code is 200-299, which indicates success, 
the response body will be decoded using the jsonDecode method, 
and then returned as a Right object via the right() method.

6. If the status code is any other value, the method returns a Left object 
with the appropriate StatusRequest value indicating a failure. 

7. If there is no internet connection, the method returns a Left object with 
the appropriate StatusRequest value indicating an offline failure.

8. Overall, this code improves the previous version with a few key changes
 such as using final for immutable variables, using range when checking 
 for status code instead of exact match, and improving the naming of StatusRequest values.
*/