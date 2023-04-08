import 'package:flutter/material.dart';

import '../widgets/language/custom_btn_lang.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Choose Language",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButtonLang(
            textbutton: 'Ar',
            onPressed: () {},
          ),
          CustomButtonLang(
            textbutton: 'En',
            onPressed: () {},
          ),
        ]),
      ),
    );
  }
}
