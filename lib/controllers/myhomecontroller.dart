import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:weathercheck/api/api_string.dart';
import 'package:weathercheck/handler/diotemplate.dart';
import 'package:weathercheck/model/currentforecastmodel.dart';
import 'package:weathercheck/model/forecastmodel.dart';
import 'package:weathercheck/model/searchplace.dart';
import 'package:weathercheck/route/routename.dart';

class MyhomeController extends GetxController {
  final Rx<Currentforecastmodel> currentModel = Currentforecastmodel().obs;
  final List<Forecastday> forecastList = <Forecastday>[].obs;
  final List<Searchplace> searchlist = <Searchplace>[].obs;
  final List<Currentforecastmodel> placelist = <Currentforecastmodel>[].obs;
  final format = DateFormat("EEEE").add_j();
  final format1getday = DateFormat("EEEE");
  final pagecontroller = PageController(initialPage: 1, viewportFraction: 0.7);
  final currentindex = 0.obs;
  final precipitation = "".obs,
      humidity = "".obs,
      wind = "".obs,
      placename = "".obs;
  final Rx<Currentforecastmodel> currentselected = Currentforecastmodel().obs;
  @override
  void onInit() {
    searchplace();
    // getCurrentForecast();
    // getForecast();

    super.onInit();
  }

  // getCurrentForecast() async {
  //   try {
  //     final response = await ServiceApi.currentforecastcall(
  //         url: ApiWeather.currentforecast, q: "Tagum City,8100,PH");

  //     currentModel(response);
  //   } finally {
  //     if (currentModel.value.location != null) {
  //       final name = currentModel.value.location!.name;
  //       // log(name.toString());
  //     }
  //   }
  // }

  getForecast(String? params) async {
    forecastList.clear();
    final response = await ServiceApi.forecastcall(
        url: ApiWeather.forecast, q: params, days: 5);
    forecastList.assignAll(response);
    log(forecastList.map((e) => e.day!.condition!.text).toString());
  }

  searchplace() async {
    try {
      final response = await ServiceApi.searchplacecall(
          url: ApiWeather.searchplace, q: "Tagum City,8100,PH");
      searchlist.assignAll(response);
    } finally {
      log(searchlist.map((e) => e.name).toList().toString());
      for (var x in searchlist) {
        log("${x.lat.toString()},${x.lon.toString()}");
        final response = await ServiceApi.currentforecastcall(
            url: ApiWeather.currentforecast,
            q: "${x.name},${x.region},PH,${x.lat},${x.lon}");

        placelist.add(response);
      }
    }
  }

  onchange(
    int? value,
  ) {
    currentindex(value);
    final model = placelist[value!];
    precipitation(model.current!.cloud.toString());

    humidity(model.current!.tempC.toString());
    wind(model.current!.windKph.toString());
  }

  onselectedgoto(Currentforecastmodel? value, String? name) {
    placename(name);
    currentselected(value);

    getForecast(
        "${placename.value},${currentselected.value.location!.region},PH,${currentselected.value.location!.lat},${currentselected.value.location!.lon}");

    Get.toNamed(weatherpage);
  }
}
