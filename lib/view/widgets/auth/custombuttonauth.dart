import 'package:flutter/material.dart';

import '../../../core/constants/color.dart';

class CustomButtomAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtomAuth({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //* I don't see its margin affect
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        //* padding to increase the height of the btn
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
