//* on it we can make dummy data for test our app or data not need to change later

import '../../core/constants/image_assets.dart';
import '../model/onboarding_model.dart';

//* no need to change later
List<OnboardingModel> onBoardingList = [
  OnboardingModel(
      title: "first",
      image: AppImageAsset.onBoardingImage1,
      body: "firstfirstfirs\ntfirstfirstfirstfi\nrstfirstfirstfirstfirst"),
  OnboardingModel(
      title: "second",
      image: AppImageAsset.onBoardingImage2,
      body: "secondsecondsecond\nsecondsecondsecondsecond\nsecondsecondsecond"),
  OnboardingModel(
      title: "third",
      image: AppImageAsset.onBoardingImage3,
      body:
          "thirdthirdthirdthirdthird\nthirdthirdthirdthirdthird\nthirdthirdthird"),
  OnboardingModel(
      title: "fourth",
      image: AppImageAsset.onBoardingImage4,
      body:
          "fourthfourthfourth\nfourthfourthfourthfourth\nfourthfourthfourthfourth"),
];
