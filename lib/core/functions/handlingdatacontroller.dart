import 'package:ecommerce_wah/core/class/statusrequest.dart';
//! there are logic error on handling data search about it

//* response == dynamic type
handlingData(response) {
  //* response type == StatusRequest data type
  if (response is StatusRequest) {
    //* when it is a status request there are error when connect
    //? we can make if statments for every condition our simply return resonse
    // if (response == StatusRequest.offlinefailure) {
    //   return StatusRequest.offlinefailure;
    // }
    return response;
  } else {
    //* if there are no error on connect => not back StatusRequest but back Map
    //? so it success
    StatusRequest.success;
  }
}
