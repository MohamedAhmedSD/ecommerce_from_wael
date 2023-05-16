import 'package:flutter/material.dart';

import '../../../core/constants/color.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 30),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        textColor: Colors.white,
        color: AppColor.primaryColor,
        onPressed: () {},
        child: const Text("Contniue"),
      ),
    );
  }
}
