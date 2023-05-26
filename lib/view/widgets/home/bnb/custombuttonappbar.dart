import 'package:flutter/material.dart';

import '../../../../core/constants/color.dart';

//* for BNB
class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  //* for select status
  //* we can give it inital value from here or on below look at it ===========
  final bool? active;
  const CustomButtonAppBar(
      {Key? key,
      required this.textbutton,
      required this.icondata,
      required this.onPressed,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        //* change color for both icon & texts
        Icon(icondata,
            color: active == true ? AppColor.primaryColor : Colors.black),
        Text(
          textbutton,
          style: TextStyle(
              //*=================================================================
              color: active == true ? AppColor.primaryColor : Colors.black),
        ),
      ]),
    );
  }
}
