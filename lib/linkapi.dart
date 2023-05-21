class AppLink {
  //! ================= server link =================
  //*?1. hosting name
  //* a. name
  static const String server = "https://ecommerce-php-wah.herokuapp.com/";
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
  static const String testdata = "$server/test/test_getalldata.php";

  //! ================= Auth data =================
  static const String signUp = "$server/auth/signup.php";
}
