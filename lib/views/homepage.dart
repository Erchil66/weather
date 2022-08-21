import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathercheck/controllers/myhomecontroller.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyhomeController());
    return const Scaffold();
  }
}
