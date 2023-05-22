

// This code imports the necessary libraries to handle API requests.
// Importing the linkapi package

// Create a TestData class to handle API requests.
import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class TestData {
  Crud crud; // Initialize a variable of type Crud to handle API requests
  //* use Crud as its paramater
  //! I make big mistake by using => ({this.crud}) => give me null data

  // Create a constructor to initialize the crud variable
  // with a passed in object of type Crud
  TestData(this.crud);

  // Create a function named 'getData' to request data from an API
  getData() async {
    //! if not back data, review your link
    // Use the crud object to call the 'postData' function,
    // passing in the AppLink.testdata as the API link and an empty Map object
    var response = await crud.postData(AppLink.testdata, {});

    // Use the 'fold' function to handle the response from the API
    // On success, return the 'Right' value (in this case, the data).
    // On error, return the 'Left' value (in this case, the error message).

    //! don't forget return or will be get this error
    //?[error] _TypeError (type 'Null' is not a subtype of type 'StatusRequest')
    return response.fold(
      (l) => l, // Return the error value of the response
      (r) => r, // Return the data value of the response
    );
  }
}

// Explanation of the code:

// This code creates a TestData class that can be used to handle API requests.

// The class includes a constructor that initializes a 'Crud' object that 
// represents the API endpoint, which is injected as a dependency  
// when an object of the class is created.

// The 'getData' method uses the injected 'Crud' object to request data from the API
// by calling the 'postData' method with a specified API link and empty map as the request parameters.

// The 'fold' function is used to handle the response from the API and returns 
//the data or error message depending on the success or failure of the API request.

// Overall, this code encapsulates API requests and error-handling logic into
// a single class, making it easy to make API requests and retrieve results from the API.
