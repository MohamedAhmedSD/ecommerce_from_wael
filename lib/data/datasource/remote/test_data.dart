// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class TestData {
  //* use Crud as its paramater
  Crud crud;
  CrudLocalServer? crudLocalServer;
  TestData({
    required this.crud,
    this.crudLocalServer,
  });

  //* make method to display data
  getData() async {
    //! if not back data, review your link
    var response = await crud.postData(AppLink.server, {});
    // var response = await crud.postData(AppLink.localServerDigits, {});
    //* use fold to back l & r for Either
    //! don't forget return or will be get this error
    //?[error] _TypeError (type 'Null' is not a subtype of type 'StatusRequest')

    return response.fold((l) => l, (r) => r);
  }

  //* by me
  getDataLocalServer() async {
    var response =
        await crudLocalServer!.postData(AppLink.localServerEmulator, {});
    var jsonData = jsonDecode(response.body);
    List dataList = [];
    for (var x in jsonData) {
      dataList.add(x);
    }
  }
}
