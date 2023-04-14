import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

//! we make global function to test is app connect to internet or not
//* check internet connection here with wifi
//! see code on testthree

checkInternet() async {
  //* may use package
  //? internet_connection_checker: ^1.0.0+1
  //? connectivity_plus: ^3.0.4
  try {
    // test with google
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true; // it not empty and first of address list not empty
    }
    // may user not connected to internet => ask about > SocketException
  } on SocketException catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false; // no connection
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

//! test it on test page

//? another way to make this method:
//* [1] it => Future<bool>
Future<bool> hasNetwork() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}

//* [2] use http with status code
Future<bool> hasNetwork2() async {
  try {
    final result = await http.get(Uri.parse('www.google.com'));
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}

Future<bool> hasNetwork4() async {
  try {
    final result = await http.get(Uri.parse('www.google.com'));
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}

///::::::::::::::::::::::::::::::::::::::::::
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// //! we can check for once tima as => api before fetch data
// //! second => as stream to keep continue connection, so when net cut make
// //! some actions

// class ConnectiviyApp extends StatefulWidget {
//   const ConnectiviyApp({super.key});

//   @override
//   State<ConnectiviyApp> createState() => _ConnectiviyAppState();
// }

// class _ConnectiviyAppState extends State<ConnectiviyApp> {
// //? we can use only one
// //! checkconnect or stream or both together

// //* to check is it connect or not
// // make a method and call it on init
// // use future
//   void checkInternet() async {
//     // it use buikt in function
//     var result = await Connectivity().checkConnectivity();
//     if (kDebugMode) {
//       print(result.name);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     checkInternet();
//   }

//   @override
//   Widget build(BuildContext context) {
//     //? handle stream, to check snapshot
//     //! Generic stream type
//     //* we need check internet status, stream not good when restart app
//     return StreamBuilder<ConnectivityResult>(
//         stream: Connectivity().onConnectivityChanged,
//         // builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//         builder: (context, snapshot) {
//           return Scaffold(
//             body: snapshot.data == ConnectivityResult.none
//                 ? const Center(child: Text("no internet connection"))
//                 : const Center(child: Text("there are internet connection")),
//           );
//         });
//   }
// }
