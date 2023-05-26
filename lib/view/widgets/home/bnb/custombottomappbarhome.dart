import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/homescreen_controller.dart';
import 'custombuttonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        //? to cut apart from BNB we need to use notch and its margin
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child:
            // Row(
            //   children: [
            //     ...List.generate(
            //       controller.listPage.length + 1,
            //       ((index) {
            //         int i = index > 2 ? index - 1 : index;
            //         return index == 2
            //             ? const Spacer()
            //             : CustomButtonAppBar(
            //                 textbutton: controller.titlebottomappbar[i],
            //                 icondata: Icons.home,
            //                 onPressed: () {
            //                   controller.changePage(i);
            //                 },
            //                 active: controller.currentpage == i ? true : false);
            //       }),
            //     ),
            //   ],
            // ),

            //! old ============================================================
            //* Row => Row => 4x [ button(columns{icon + text})]
            //? make spacer bettween 2 && 3 to make space to use it latter by floatingAB
            //     Row(
            //   children: [
            //     Row(
            //       children: [
            //         //! better programer who can shorts its code
            //         //* MaterialButton => repeated
            //         //? we need change icon,text,current page

            //         MaterialButton(
            //           onPressed: () {
            //             //* when press on it go into certain page
            //             controller.changePage(0);
            //           },
            //           child: Column(
            //             //! must use its min size to avoid error
            //             mainAxisSize: MainAxisSize.min,
            //             children: const [Icon(Icons.home), Text('Home')],
            //           ),
            //         ),
            //         MaterialButton(
            //           onPressed: () {
            //             controller.changePage(1);
            //           },
            //           child: Column(
            //             //! must use its min size to avoid error
            //             mainAxisSize: MainAxisSize.min,
            //             children: const [Icon(Icons.home), Text('Settings')],
            //           ),
            //         ),
            //         const Spacer(),
            //         MaterialButton(
            //           onPressed: () {
            //             controller.changePage(2);
            //           },
            //           child: Column(
            //             //! must use its min size to avoid error
            //             mainAxisSize: MainAxisSize.min,
            //             children: const [Icon(Icons.home), Text('Profiles')],
            //           ),
            //         ),
            //         MaterialButton(
            //           onPressed: () {
            //             controller.changePage(3);
            //           },
            //           child: Column(
            //             //! must use its min size to avoid error
            //             mainAxisSize: MainAxisSize.min,
            //             children: const [Icon(Icons.home), Text('Favourite')],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),

            //! old => shortcut ===============================================
            //* change materialbutton by CustomButtonAppBar
            Row(
          children: [
            Row(
              children: [
                CustomButtonAppBar(
                  textbutton: 'home',
                  icondata: Icons.home,
                  onPressed: () {},
                  //* what color we use when select or not
                  //* if we are on certain page => active color == true
                  active: controller.currentpage == 0 ? true : false,
                ),
                CustomButtonAppBar(
                  textbutton: 'settings',
                  icondata: Icons.home,
                  onPressed: () {},
                  active: controller.currentpage == 1 ? true : false,
                ),
                const Spacer(),
                CustomButtonAppBar(
                  textbutton: 'profile',
                  icondata: Icons.home,
                  onPressed: () {},
                  active: controller.currentpage == 2 ? true : false,
                ),
                CustomButtonAppBar(
                  textbutton: 'favorites',
                  icondata: Icons.home,
                  onPressed: () {},
                  active: controller.currentpage == 3 ? true : false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
