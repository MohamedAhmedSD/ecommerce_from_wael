//! we make enum carry all possible =>  StatusRequest,
//* when we call to internet
enum StatusRequest {
  loading,
  success,
  failure, //error on php
  serverfailure,
  offlinefailure
}
