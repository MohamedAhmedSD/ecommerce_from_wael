import 'package:flutter/material.dart';

import '../../../core/constants/image_assets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 70,
        backgroundColor: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(0), // Border radius
          child: ClipOval(
            child: Image.asset(
              AppImageAsset.logo,
            ),
          ),
        ));
  }
}
