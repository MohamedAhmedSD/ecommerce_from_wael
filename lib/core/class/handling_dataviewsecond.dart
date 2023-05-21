import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/image_assets.dart';
import 'statusrequest.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (statusRequest) {
      case StatusRequest.loading:
        return Center(
            child: Lottie.asset(
          AppImageAsset.loading,
          width: 250,
          height: 250,
        ));
      case StatusRequest.offlinefailure:
        return Center(
            child: Lottie.asset(
          AppImageAsset.offline,
          width: 250,
          height: 250,
        ));
      case StatusRequest.serverfailure:
        return Center(
            child: Lottie.asset(
          AppImageAsset.server,
          width: 250,
          height: 250,
        ));
      case StatusRequest.failure:
        return Center(
            child: Lottie.asset(
          AppImageAsset.noData,
          width: 250,
          height: 250,
          repeat: true,
        ));
      default:
        return widget;
    }
  }
}

/*
Explanation:

1. The code imports the necessary libraries to use Lottie animations 
and the StatusRequest enum from the core/class folder.

2. A StatelessWidget class named HandlingDataView is created and 
has two required variables, statusRequest of type StatusRequest, and widget of type Widget.

3. In the build method, a switch statement is used to determine 
what to display based on the provided statusRequest value.

4. When displaying a loading animation, the Lottie.asset method is used to
 load the appropriate animation file from the Assets folder.

5. The same process is used to display offline and server failure animation,
 using the Lottie.asset method to load the right files from the Assets folder.

6. When there is no data or result returned, the Lottie.asset method is used 
to display a No Data animation file with an option to repeat.

7. If none of the above cases match the statusRequest value, the widget is returned.

8. Overall, this code is an improved version of the previous one since 
it uses a switch statement instead of a ternary operator, more readable variables, 
and improved naming.

*/