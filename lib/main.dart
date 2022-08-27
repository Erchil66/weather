import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';

import 'package:weathercheck/route/routelist.dart';
import 'package:weathercheck/route/routename.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, x, y) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        getPages: Routelist.list,
        initialRoute: home,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
