import 'package:get/get.dart';
import 'package:weathercheck/route/routename.dart';
import 'package:weathercheck/views/homepage.dart';
import 'package:weathercheck/views/waetherdetail.dart';

class Routelist {
  static List<GetPage> list = <GetPage>[
    GetPage(
      name: home,
      page: () => const MyHomePage(),
    ),
    GetPage(
      name: weatherpage,
      page: () => const Weatherdetail(),
    )
  ];
}
