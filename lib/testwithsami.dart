import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//! we can check for once tima as => api before fetch data
//! second => as stream to keep continue connection, so when net cut make
//! some actions

class ConnectiviyApp extends StatefulWidget {
  const ConnectiviyApp({super.key});

  @override
  State<ConnectiviyApp> createState() => _ConnectiviyAppState();
}

class _ConnectiviyAppState extends State<ConnectiviyApp> {
//? we can use only one
//! checkconnect or stream or both together

//* to check is it connect or not
// make a method and call it on init
// use future
  void checkConnectivity() async {
    // it use buikt in function
    var result = await Connectivity().checkConnectivity();
    if (kDebugMode) {
      print(result.name);
    }
  }

  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    //? handle stream, to check snapshot
    //! Generic stream type
    //* we need check internet status, stream not good when restart app
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        // builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        builder: (context, snapshot) {
          return Scaffold(
            body: snapshot.data == ConnectivityResult.none
                ? const Center(child: Text("no internet connection"))
                : const Center(child: Text("there are internet connection")),
          );
        });
  }
}
