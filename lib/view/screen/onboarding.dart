import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding_controller.dart';
// import '../../core/constants/color.dart';
// import '../../data/datasource/static/static.dart';
import '../widgets/onboarding/custom_button.dart';
import '../widgets/onboarding/custom_slider.dart';
import '../widgets/onboarding/dot_controller.dart';

// class OnBoarding extends StatelessWidget {
//   const OnBoarding({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // use saveArea to avoid phone appBar
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               flex: 2,
//               child: PageView.builder(
//                 // we use length of our list as itemCount
//                 itemCount: onBoardingList.length,
//                 // how we use itemBuilder
//                 // it need index, use it to access data inside our list
//                 itemBuilder: (context, i) => Column(
//                   children: [
//                     Text(onBoardingList[i].title!,
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 20)),
//                     const SizedBox(height: 80),
//                     Image.asset(
//                       onBoardingList[i].image!,
//                       width: 200,
//                       height: 230,
//                       fit: BoxFit.fill,
//                     ),
//                     // error render
//                     // const SizedBox(height: 80),

//                     // text center and take full width
//                     Container(
//                       width: double.infinity,
//                       alignment: Alignment.center,
//                       child: Text(
//                         onBoardingList[i].body!,
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                             height: 2, // space between lines
//                             color: AppColor.grey,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 17),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             //::::::::::::::::::::::::::
//             Expanded(
//               flex: 1,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ...List.generate(
//                     onBoardingList.length,
//                     (index) => AnimatedContainer(
//                       margin: const EdgeInsets.only(right: 5),
//                       duration: const Duration(milliseconds: 900),
//                       width: 6,
//                       height: 6,
//                       decoration: BoxDecoration(
//                           color: AppColor.primaryColor,
//                           borderRadius: BorderRadius.circular(10)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // const Spacer(
//             //   flex: 2,
//             // ),
//             Container(
//               margin: const EdgeInsets.only(bottom: 30),
//               height: 40,
//               child: MaterialButton(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
//                   textColor: Colors.white,
//                   onPressed: () {},
//                   color: AppColor.primaryColor,
//                   child: const Text("Continue")),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/// This error message occurs when you are using an Expanded widget inside
/// a Column or a Row widget, and the incoming height constraints are unbounded.
/// In other words, the Expanded widgets are trying to take up more space than is available.

/// When using a PageView widget inside an Expanded widget,
/// you can wrap the PageView with an IntrinsicHeight widget to
/// constrain the height of the PageView to the available height.
///
/// Expanded(
//   child: IntrinsicHeight(
//     child: PageView(
//       children: [
//         // Your pages go here...
//       ],
//     ),
//   ),
// )

// class OnBoarding extends StatelessWidget {
//   const OnBoarding({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         // use saveArea to avoid phone appBar
//         body: SafeArea(
//           child: Column(children: const [
//             Expanded(
//               flex: 3,
//               child: IntrinsicHeight(child: CustomSliderOnBoarding()),
//             ),
//             // part not slide
//             // controller of dots && button
//             // Expanded(
//             //   flex: 1,
//             //   child: Column(
//             //     children: const [
//             CustomDotControllerOnBoarding(),
//             // Spacer(flex: 1),
//             SizedBox(
//               height: 8.0,
//             ),
//             CustomButtonOnBoarding(),
//             //     ],
//             //   ),
//             // ),
//           ]),
//         ));
//   }
// }

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // to access controller from any place
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            const Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            Column(
              children: const [
                CustomDotControllerOnBoarding(),
                // Spacer(flex: 2),
                SizedBox(height: 8.0,),
                CustomButtonOnBoarding()
              ],
            )
          ]),
        ));
  }
}
