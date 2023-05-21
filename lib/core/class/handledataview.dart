import 'package:ecommerce_wah/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/image_assets.dart';
//? when use lottie => better download as json, to be able more properties

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest; // Holds the status of the request
  final Widget widget; // Holds the widget to be shown
  const HandlingDataView({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Returns different widgets based on the status of the request
    return statusRequest == StatusRequest.loading
        ? Center(
            // Displays a loading animation using the Lottie package
            child: Lottie.asset(
              AppImageAsset.loading,
              width: 250,
              height: 250,
            ),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                // Displays an offline failure animation using Lottie
                child: Lottie.asset(
                  AppImageAsset.offline,
                  width: 250,
                  height: 250,
                ),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    // Displays a server failure animation using Lottie
                    child: Lottie.asset(
                      AppImageAsset.server,
                      width: 250,
                      height: 250,
                    ),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        // Displays a 'no data' animation using Lottie
                        child: Lottie.asset(
                          AppImageAsset.noData,
                          width: 250,
                          height: 250,
                          //! repeat animation or not
                          repeat: true,
                        ),
                      )
                    : widget; // Displays the provided widget
  }
}
