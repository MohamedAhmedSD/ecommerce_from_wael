class AppLink {
  //! ================= server link =================
  //*?1. hosting name
  //* a. name
  static const String server = "http://sheikhbtoo.atwebpages.com";
//* b. digits
  static const String serverDigits = "http://185.27.134.10/ecommerce_project/";

  //? 2. local server
  //* a. localhost
  static const String localServer =
      "http://localhost/ecommerce/wah/ecommerce_project/";
  //* b. emulator
  static const String localServerEmulator =
      "http://10.0.2.2/ecommerce/wah/ecommerce_project/";
  //* c. wifi
  static const String localServerWifi =
      "http://192.168.43.211/ecommerce/wah/ecommerce_project/";
  //* d. localhost digits => run on windows
  static const String localServerDigits =
      "http://127.0.0.1/ecommerce/wah/ecommerce_project/";

  //! ================= test data =================
  // static const String testdata = "$server/test/test_getalldata.php";
  static const String testdata = "$server/read.php";

  //! ================= Auth data =================
  static const String signUp = "$server/auth/signup.php";
  // static const String signUp = "$server/test_phpmailer.php";

  static const String verifyCodeSignUp = "$server/auth/verifycode.php";
  static const String login = "$server/auth/login.php";

  static const String imageststatic = "$server/upload";
//========================== Image ============================
  static const String imagestCategories = "$imageststatic/categories";
  static const String imagestItems = "$imageststatic/items";
// =============================================================
//
  static const String test = "$server/test.php";

// ================================= Auth ========================== //

  static const String verifycodessignup = "$server/auth/verfiycode.php";

// ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";

// Home

  static const String homepage = "$server/home.php";
}
