import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;

  //* keyboard use bool type if I wanna used only 2 types,
  //* if we deal with more use String data type to choose keyboard type
  //* number or text type only

  final bool isNumber;
  //* we make its obscure as non-nullable
  //* we use it only with password
  final bool? obscureText;
  final void Function()? onTapIcon;

  const CustomTextFormAuth(
      {Key? key,
      this.obscureText,
      this.onTapIcon,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
      required this.valid,
      required this.isNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        //* we change KB type according to => isNumber
        keyboardType: isNumber
            //! ======== decimal . we need it on price ================
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,

        validator: valid,
        controller: mycontroller,

        //? if it null or false make it false : or it true ====================
        obscureText: obscureText == null || obscureText == false ? false : true,
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

            //* icon that not required
            //? ontapIcon is funsion under inkwell => to use it with password hiden
            //! will we use IconData always to create icons inside TFF
            suffixIcon: InkWell(onTap: onTapIcon, child: Icon(iconData)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
