import 'dart:io';
import 'package:flutter/material.dart';

//! Error: Unsupported operation: InternetAddress.lookup

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GeeksforGeeks"),
      ),
      body: Column(
        children: [
          Text("Active Connection? $activeConnection"),
          const Divider(),
          Text(T),
          OutlinedButton(
              onPressed: () {
                checkUserConnection();
              },
              child: const Text("Check"))
        ],
      ),
    );
  }

  bool activeConnection = false;
  String T = "";
  Future checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          activeConnection = true;
          T = "Turn off the data and repress again";
        });
      }
    } on SocketException catch (_) {
      setState(() {
        activeConnection = false;
        T = "Turn On the data and repress again";
      });
    }
  }
}
