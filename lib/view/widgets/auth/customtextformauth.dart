// import 'package:flutter/material.dart';

// // make widget as stl not as function == wrong
// // just make stl then cut and paste your widget under return

// // bito => shift + alt + e
// class CustomTextFormAuth extends StatelessWidget {
//   final String hinttext;
//   final String labeltext;
//   final IconData iconData;
//   // controller TEC => to use it when input text
//   ///  the mycontroller is used to set a controller for the text field, allowing for easier access to the text that is entered into the text field.
//   final TextEditingController? mycontroller;

//   const CustomTextFormAuth(
//       {Key? key,
//       required this.hinttext,
//       required this.labeltext,
//       required this.iconData,
//       this.mycontroller})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       child: TextFormField(
//         controller: mycontroller,
//         decoration: InputDecoration(
//           hintText: hinttext,
//           hintStyle: const TextStyle(fontSize: 14),
//           // to fix label on certain place
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
//           label: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 9),
//               child: Text(labeltext)),
//           suffixIcon: Icon(iconData),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//       ),
//     );
//   }
// }

// new
import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  // keyboard type if I wana only 2 types,
  // if we deal with more use String type
  final bool isNumber;
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
        // we change KB type according to => isNumber
        keyboardType: isNumber
            // decimal . we need it on price
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labeltext)),
            suffixIcon: InkWell(onTap: onTapIcon, child: Icon(iconData)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
