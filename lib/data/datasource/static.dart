//* on it we can make dummy data for test our app or data not need to change later

import '../../core/constants/image_assets.dart';
import '../model/onboarding_model.dart';

//* no need to change later
List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "Choose Product",
      body:
          "We Have a 100k Product , Choose \n Your Product From  Our \n E-commerce Shop",
      image: AppImageAsset.onBoardingImageOne),
  OnBoardingModel(
      title: "Easy And Safe Paymnet",
      body:
          "We Have a 100k Product , Choose \n Your Product From Our E-commerce Shop",
      image: AppImageAsset.onBoardingImageTwo),
  OnBoardingModel(
      title: "Track Your Order",
      body:
          "We Have a 100k Product , Choose \n Your Product From Our E-commerce Shop",
      image: AppImageAsset.onBoardingImageThree),
  //! To use only three not four
  // OnBoardingModel(
  //     title: "Fast Delivery",
  //     body:
  //         "We Have a 100k Product , Choose \n Your Product From Our E-commerce Shop",
  //     image: AppImageAsset.onBoardingImageFour),
];
