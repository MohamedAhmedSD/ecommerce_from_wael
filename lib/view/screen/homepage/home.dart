import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/class/handledataview.dart';
import '../../widgets/home/customappbar.dart';
import '../../widgets/home/customcardhome.dart';
import '../../widgets/home/customtitlehome.dart';
import '../../widgets/home/listcategorieshome.dart';
import '../../widgets/home/listitemshome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children: [
                      CustomAppBar(
                          titleappbar: "Find Product",
                          onPressedIcon: () {},
                          onPressedSearch: () {}),
                      const CustomCardHome(
                          title: "A summer surprise", body: "Cashback 20%"),
                      const ListCategoriesHome(),
                      const SizedBox(height: 10),
                      const CustomTitleHome(title: "Product for you"),
                      const SizedBox(height: 10),
                      const ListItemsHome(),
                      const CustomTitleHome(title: "Offer"),
                      const SizedBox(height: 10),
                      const ListItemsHome()
                    ],
                  )))),
    );
  }
}