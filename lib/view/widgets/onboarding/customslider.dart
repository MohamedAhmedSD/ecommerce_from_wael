import 'package:flutter/material.dart';

import '../../../core/constants/color.dart';
import '../../../data/datasource/static.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          Text(
            "${onBoardingList[i].title}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 80,
          ),
          //? ========== try use same ratio of oraginal image =====
          Image.asset(
            "${onBoardingList[i].image}",
            width: 200,
            height: 230,
            fit: BoxFit.fill,
          ),
          //! [hint] no need to use sizedbox here
          // const SizedBox(
          //   height: 80,
          // ),
          //? ======== use alignment for Container && text =======
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "${onBoardingList[i].body}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 2,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}