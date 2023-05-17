import 'package:flutter/material.dart';

import '../../widgets/language/custombuttonlang.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      //* use padding to make the btn
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Choose Language",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          //? some time if not write onPressed: () {},
          //* btn not appear on screen
          CustomButtonLang(
            textbutton: 'Ar',
            onPressed: () {},
          ),
          CustomButtonLang(
            textbutton: 'En',
            onPressed: () {},
          ),
        ],
      ),
    ));
  }
}
