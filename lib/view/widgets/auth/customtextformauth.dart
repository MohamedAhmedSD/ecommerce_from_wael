import 'package:flutter/material.dart';

class CustonTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;

  const CustonTextFormAuth(
      {Key? key,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      this.mycontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: mycontroller,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(fontSize: 14),
          //* =================================================================
          //* to fix label text == don't move
          floatingLabelBehavior: FloatingLabelBehavior.always,
          //* move your indicator place == start position of hint text and others texts
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          //* =================================================================
          //* we wrap Text inside Container to make margin for our label
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(labeltext),
          ),
          //* =================================================================
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
