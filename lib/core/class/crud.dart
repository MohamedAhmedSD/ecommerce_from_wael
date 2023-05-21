import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../functions/checkinternet.dart';
import 'statusrequest.dart';

// This code imports the necessary libraries to handle API requests and check for internet connection.
// Importing the http.dart library for HTTP requests

// Create a Crud class to handle API requests.
class Crud {
  //* to use Either == functional programing method , we use dartz package
  //* may back Map [data from backend are json] or other things when there are error

  // Create a function named 'postData' to send data to an API
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    // Check if there is an internet connection before making the API request
    if (await checkInternet()) {
      // Use the http.post() method to make a POST request to the provided URL, passing in the data as the request body
      var response = await http.post(Uri.parse(linkurl), body: data);

      // Print the status code for debugging purposes
      print(response.statusCode);

      // If the status code is 200 (OK) or 201 (Created), decode the response body and return it
      if (response.statusCode == 200 || response.statusCode == 201) {
        //* back json
        Map responsebody = jsonDecode(
            response.body); // Decode the response body using jsonDecode()
        print(responsebody); // Print the body for debugging purposes
        return Right(responsebody);
      }
      // If the status code is any other value, return a Left object with the appropriate StatusRequest value indicating a server failure
      else {
        //* wrong page
        return const Left(StatusRequest.serverfailure);
      }
    }
    // If there is no internet connection, return a Left object with the appropriate StatusRequest value indicating an offline failure
    else {
      //* not connect to internet
      return const Left(StatusRequest.offlinefailure);
    }
  }
}

//! we can try use => try && catch =>
/**
 * catch (_) {
      return const Left(StatusRequest.serverException);
    }
 */
// Explanation of the code:

// This code creates a 'Crud' class that can be used to send data to an API.

// The 'postData' method makes a POST request with the provided URL and data. 
//Before the request is made, it checks for an internet connection 
//using the 'checkInternet' function.

// If there is an internet connection and the request is successful 
//(status code == 200 or 201), the response body is decoded and 
//returned as a Right object containing the data. If the response is unsuccessful,
// a Left object is returned with the appropriate 
//'StatusRequest' value indicating a server failure.

// If there is no internet connection, a Left object is returned with the appropriate 
//'StatusRequest' value indicating an offline failure.

// Overall, this code provides an easy way to make HTTP POST requests 
//to an API and handles errors gracefully using Either types and custom status request values.
