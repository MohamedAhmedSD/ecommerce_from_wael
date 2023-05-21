import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

// class TestData {
//   //* use Crud as its paramater
//   //! I make big mistake by using => ({this.crud}) => give me null data
//   Crud crud;
//   TestData(
//     this.crud,
//   );

//   //* make method to display data
//   getData() async {
//     //! if not back data, review your link
//     var response = await crud.postData(AppLink.testdata, {});

//     //* use fold to back l & r for Either
//     //! don't forget return or will be get this error
//     //?[error] _TypeError (type 'Null' is not a subtype of type 'StatusRequest')

//     return response.fold((l) => l, (r) => r);
//   }
// }

class TestData {
  Crud crud;

  TestData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.testdata, {});
    return response.fold((l) => l, (r) => r);
  }
}
