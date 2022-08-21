import 'dart:developer';

import 'package:get/get.dart';
import 'package:weathercheck/api/api_string.dart';
import 'package:weathercheck/handler/diotemplate.dart';
import 'package:weathercheck/model/currentforecastmodel.dart';
import 'package:weathercheck/model/forecastmodel.dart';
import 'package:weathercheck/model/searchplace.dart';

class MyhomeController extends GetxController {
  final Rx<Currentforecastmodel> currentModel = Currentforecastmodel().obs;
  final List<Forecastday> forecastList = <Forecastday>[].obs;
  final List<Searchplace> searchlist = <Searchplace>[].obs;
  @override
  void onInit() {
    getCurrentForecast();
    getForecast();
    searchplace();
    super.onInit();
  }

  getCurrentForecast() async {
    try {
      final response = await ServiceApi.currentforecastcall(
          url: ApiWeather.currentforecast, q: "Tagum City,8100,PH");

      currentModel(response);
    } finally {
      if (currentModel.value.location != null) {
        final name = currentModel.value.location!.name;
        log(name.toString());
      }
    }
  }

  getForecast() async {
    try {
      final response = await ServiceApi.forecastcall(
          url: ApiWeather.forecast, q: "Tagum City,8100,PH", days: 2);
      forecastList.assignAll(response);
    } finally {
      log(forecastList.map((e) => e.date).toList().toString());
    }
  }

  searchplace() async {
    try {
      final response = await ServiceApi.searchplacecall(
          url: ApiWeather.searchplace, q: "Tagum City,8100,PH");
      searchlist.assignAll(response);
    } finally {
      log(searchlist.map((e) => e.name).toList().toString());
    }
  }
}
