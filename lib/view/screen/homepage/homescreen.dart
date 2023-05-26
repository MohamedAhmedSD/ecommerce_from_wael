import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homescreen_controller.dart';
import '../../widgets/home/custombottomappbarhome.dart';

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
                  onPressed: () {},
                  child: const Icon(Icons.shopping_basket_outlined)),
              //? by determain its location
              //* Docked == inside the bottomNavbar,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,

              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: controller.listPage.elementAt(controller.currentpage),
            ));
  }
}
