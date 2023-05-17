import '../../../core/constants/color.dart';
import 'package:flutter/material.dart';

class CustomButtonLang extends StatelessWidget {
  //* we need change both => text && method
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonLang({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      //* use padding to make the btn with width properties
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(
          textbutton,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
