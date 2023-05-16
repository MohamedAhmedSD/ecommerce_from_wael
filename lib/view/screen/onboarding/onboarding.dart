import 'package:ecommerce_wah/core/constants/color.dart';
import 'package:flutter/material.dart';

import '../../../data/datasource/static.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView.builder(
              itemCount: onBoardingList.length,
              itemBuilder: (context, i) => Column(
                    children: [
                      Text(
                        "${onBoardingList[i].title}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      //? ========== try use same ratio of oraginal image =====
                      Image.asset(
                        "${onBoardingList[i].image}",
                        width: 200,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      //? ======== use alignment for Container && text =======
                      Container(
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
                  ))),
    );
  }
}
