// 1- Import necessary libraries
import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

// 2- Create a TestData class to handle API requests

class TestDataSecond {
  // 3- Initialize a crud variable of type Crud
  final Crud crud;

  // 4- Create a constructor for the TestData class that takes in a Crud object
  TestDataSecond(this.crud);

  // 5- Create a getData function to request data from API
  Future<dynamic> getData() async {
    try {
      // 6- Call the postData function from the crud object to make a POST request to the API
      final response = await crud.postData(AppLink.testdata, {});

      // 7- Use fold to handle either the Left (error) or Right (success) response.
      // If it is a Left response, return the error. If it is a Right response, return the data.
      return response.fold((l) => l, (r) => r);
    } catch (e) {
      // 8- If there is an error, throw an exception with the error message
      throw Exception(e.toString());
    }
  }
}

// Explanation of changes and code functionality:

// This code has been improved to handle errors that may occur during the API request.

// The getData function now handles both success and errors using fold, 
//which is a cleaner way to handle Either types in Dart.

// The ApiLink test is now a global variable that is imported from an external 
//file to allow for easier updates in case of API changes.

// The code has been commented with more details to explain what each part of the code does.

// The return type of the getData function is now "dynamic" to capture the response, 
//which can be either an error or data. This allows the caller to handle the response appropriately.



