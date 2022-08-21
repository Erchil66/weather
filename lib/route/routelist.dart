import 'package:get/get.dart';
import 'package:weathercheck/route/routename.dart';
import 'package:weathercheck/views/homepage.dart';

class Routelist {
  static List<GetPage> list = <GetPage>[
    GetPage(name: home, page: () => const MyHomePage())
  ];
}
