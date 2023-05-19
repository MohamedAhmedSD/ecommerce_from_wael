//* better to use App before every constants class
class AppImageAsset {
  //! [1] onBoarding
  //? [A]
  // //* save route of image asset on certain variable == rootImages
  // static const String rootImages = "assets/images";
  // static const String onBoardingImageOne = "$rootImages/onboardingone.PNG";
  // static const String onBoardingImageTwo = "$rootImages/onboardingtwo.PNG";
  // static const String onBoardingImageThree = "$rootImages/onboardingthree.PNG";
  // static const String onBoardingImageFour = "$rootImages/onboardingfour.PNG";

  //? [B]
  static const String rootImages = "assets/images";
  static const String onBoardingImageOne = "$rootImages/one.PNG";
  static const String onBoardingImageTwo = "$rootImages/two.PNG";
  static const String onBoardingImageThree = "$rootImages/three.PNG";
  static const String onBoardingImageFour = "$rootImages/one.PNG";

  //![2] Login page
  static const String logoapp = "$rootImages/logoapp.png";
  static const String logo = "$rootImages/logo.png";

  //! [3] lottile
  static const String rootLottie = "assets/lottie";

  static const String loading = "$rootLottie/loading.json";
  static const String offline = "$rootLottie/offline.json";
  static const String noData = "$rootLottie/nodata.json";
  static const String server = "$rootLottie/server.json";
}
