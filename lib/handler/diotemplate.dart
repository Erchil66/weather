import 'package:dio/dio.dart';
import 'package:weathercheck/constant/keys.dart';
import 'package:weathercheck/model/currentforecastmodel.dart';
import 'package:weathercheck/model/forecastmodel.dart';
import 'package:weathercheck/model/searchplace.dart';

class ServiceApi {
  static final dio = Dio();

  static Future<Currentforecastmodel> currentforecastcall(
      {String? url, q}) async {
    final response = await dio.get("$url?key=$apikey&q=$q&aqi=yes");
    if (response.statusCode == 200) {
      return Currentforecastmodel.fromJson(response.data);
    } else {
      return response.data;
    }
  }

  static Future<List<Forecastday>> forecastcall({
    String? url,
    q,
    int? days,
  }) async {
    final response =
        await dio.get("$url?key=$apikey&q=$q&days=$days&aqi=yes&alerts=no");
    if (response.statusCode == 200) {
      final List<dynamic> list = response.data["forecast"]["forecastday"];
      return list.map((e) => Forecastday.fromJson(e)).toList();
    } else {
      return response.data;
    }
  }

  static Future<List<Searchplace>> searchplacecall({String? url, q}) async {
    final response = await dio.get("$url?key=$apikey&q=$q");
    if (response.statusCode == 200) {
      final List<dynamic> list = response.data;
      return list.map((e) => Searchplace.fromJson(e)).toList();
    } else {
      return response.data;
    }
  }
}
