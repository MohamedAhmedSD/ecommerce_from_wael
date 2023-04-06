import 'package:flutter/material.dart';

import '../../../core/constants/color.dart';
import '../../../data/datasource/static/static.dart';

/// PageView => carry three:
/// title, image, body == desc
class CustomSliderOnBoarding extends StatelessWidget {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // we use length of our list as itemCount
        itemCount: onBoardingList.length,
        // how we use itemBuilder
        // it need index, use it to access data inside our list
        itemBuilder: (context, i) => Column(
              children: [
                Text(onBoardingList[i].title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(height: 80),
                Image.asset(
                  onBoardingList[i].image!,
                  width: 200,
                  height: 230,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 80),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onBoardingList[i].body!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          height: 2,
                          color: AppColor.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    )),
              ],
            ));
  }
}
