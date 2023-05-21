import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../functions/checkinternet.dart';
import 'statusrequest.dart';

class Crud {
  //* to use Either == functional programing method , we use dartz package
  //* may back Map [data from backend are json] or other things when there are error

  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        // print(response.statusCode);

        if (response.statusCode == 200 || response.statusCode == 201) {
          //* back json
          Map responsebody = jsonDecode(response.body);
          // print(responsebody);

          return Right(responsebody);
        } else {
          //* wrong page
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        //* not connect to internet
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }
}


