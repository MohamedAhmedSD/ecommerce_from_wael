import '../../../core/constants/image_assets.dart';
import '../../model/onboarding_model.dart';

// data source may => static, local, remote
// List<T>
List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "Choose Product",
      body: // we confirm => new line => \n
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
  // OnBoardingModel(
  //     title: "Fast Delivery",
  //     body:
  //         "We Have a 100k Product , Choose \n Your Product From Our E-commerce Shop",
  //     image: AppImageAsset.onBoardingImageFour),
];
