import 'package:weathercheck/assets/imagestring.dart';

class ReturnImage {
  static String manualreturn(String? type) {
    if (type == "Sunny") {
      return sunny;
    } else if (type == "Patchy rain possible") {
      return rain;
    } else {
      return cloud2;
    }
  }
}
