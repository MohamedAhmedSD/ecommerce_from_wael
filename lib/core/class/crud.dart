import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_wael/core/class/statusrequest.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import '../functions/checkinternet.dart';

// we need put wifi possibblity
// till that rewrite code without check
// read how we do it by => get connect, dio

class Crud {
  // we make function that able take any data type from =>
  // StatusRequest, or Map as json when back from php
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      // we can connect to internet
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        // it connect and found page
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          // Map responsebody = json.decode(response.body);
          if (kDebugMode) {
            print(responsebody);
          }
          // Right == Map
          return Right(responsebody);
        } else {
          // if wrong page name
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        // no connection
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
}


//::::::::::::::::::::::::::::
