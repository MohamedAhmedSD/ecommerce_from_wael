import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homescreen_controller.dart';
import '../../../core/constants/color.dart';
import '../../widgets/home/bnb/custombottomappbarhome.dart';

//? try don't use packages if you can build what you want by yourself
//* to avoid errors with updates

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              // backgroundColor: Colors.red,
              //* how we use it inside bottomNavbar
              floatingActionButton: FloatingActionButton(
                  backgroundColor: AppColor.primaryColor,
                  onPressed: () {},
                  child: const Icon(Icons.shopping_basket_outlined)),
              //? by determain its location
              //* Docked == inside the bottomNavbar,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,

              bottomNavigationBar: const CustomBottomAppBarHome(),

              //* how we nav between screens
              //? access our screens list, use elementAt to reach to its place
              //* then call certain metod that change or screen index
              body: controller.listPage.elementAt(controller.currentpage),
            ));
  }
}
