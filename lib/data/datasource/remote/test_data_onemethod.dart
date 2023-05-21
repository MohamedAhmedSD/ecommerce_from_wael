// import '../../../core/class/crud.dart';
import '../../../core/class/crud_adjust.dart';
import '../../../linkapi.dart';

// This code imports the necessary libraries to handle API requests.
// Importing the linkapi package

// Create a TestData class to handle API requests.
class TestDataOneMethod {
  CrudOne crud; // Initialize a variable of type Crud to handle API requests
  //* use Crud as its paramater
  //! I make big mistake by using => ({this.crud}) => give me null data

  // Create a constructor to initialize the crud variable
  // with a passed in object of type Crud
  TestDataOneMethod(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.testdata, {});
    return response ?? {}; // Return an empty `Map` if `response` is null
  }
}






// In this updated function, we removed the usage of `fold` and returned only
// the data that is saved in `response`. If `response` is null, we are 
// returning an empty `Map` by default.