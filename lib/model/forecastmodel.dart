// To parse this JSON data, do
//
//     final forecastModel = forecastModelFromJson(jsonString);

import 'dart:convert';

ForecastModel forecastModelFromJson(String str) =>
    ForecastModel.fromJson(json.decode(str));

String forecastModelToJson(ForecastModel data) => json.encode(data.toJson());

class ForecastModel {
  ForecastModel({
    this.forecast,
  });

  Forecast? forecast;

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
        forecast: json["forecast"] == null
            ? null
            : Forecast.fromJson(json["forecast"]),
      );

  Map<String, dynamic> toJson() => {
        "forecast": forecast == null ? null : forecast!.toJson(),
      };
}

class Forecast {
  Forecast({
    this.forecastday,
  });

  List<Forecastday>? forecastday;

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: json["forecastday"] == null
            ? null
            : List<Forecastday>.from(
                json["forecastday"].map((x) => Forecastday.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "forecastday": forecastday == null
            ? null
            : List<dynamic>.from(forecastday!.map((x) => x.toJson())),
      };
}

class Forecastday {
  Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  DateTime? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"] == null ? null : json["date_epoch"]!,
        day: json["day"] == null ? null : Day.fromJson(json["day"]),
        astro: json["astro"] == null ? null : Astro.fromJson(json["astro"]),
        hour: json["hour"] == null
            ? null
            : List<Hour>.from(json["hour"].map((x) => Hour.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "date_epoch": dateEpoch == null ? null : dateEpoch!,
        "day": day == null ? null : day!.toJson(),
        "astro": astro == null ? null : astro!.toJson(),
        "hour": hour == null
            ? null
            : List<dynamic>.from(hour!.map((x) => x.toJson())),
      };
}

class Astro {
  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
  });

  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  String? moonIllumination;

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
        sunrise: json["sunrise"] == null ? null : json["sunrise"]!,
        sunset: json["sunset"] == null ? null : json["sunset"]!,
        moonrise: json["moonrise"] == null ? null : json["moonrise"]!,
        moonset: json["moonset"] == null ? null : json["moonset"]!,
        moonPhase: json["moon_phase"] == null ? null : json["moon_phase"]!,
        moonIllumination: json["moon_illumination"] == null
            ? null
            : json["moon_illumination"]!,
      );

  Map<String, dynamic> toJson() => {
        "sunrise": sunrise == null ? null : sunrise!,
        "sunset": sunset == null ? null : sunset!,
        "moonrise": moonrise == null ? null : moonrise!,
        "moonset": moonset == null ? null : moonset!,
        "moon_phase": moonPhase == null ? null : moonPhase!,
        "moon_illumination":
            moonIllumination == null ? null : moonIllumination!,
      };
}

class Day {
  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
    this.airQuality,
  });

  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  double? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  double? avgvisKm;
  double? avgvisMiles;
  double? avghumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  double? uv;
  AirQuality? airQuality;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC:
            json["maxtemp_c"] == null ? null : json["maxtemp_c"].toDouble()!,
        maxtempF:
            json["maxtemp_f"] == null ? null : json["maxtemp_f"].toDouble()!,
        mintempC:
            json["mintemp_c"] == null ? null : json["mintemp_c"].toDouble()!,
        mintempF:
            json["mintemp_f"] == null ? null : json["mintemp_f"].toDouble()!,
        avgtempC:
            json["avgtemp_c"] == null ? null : json["avgtemp_c"].toDouble()!,
        avgtempF:
            json["avgtemp_f"] == null ? null : json["avgtemp_f"].toDouble()!,
        maxwindMph: json["maxwind_mph"] == null
            ? null
            : json["maxwind_mph"].toDouble()!,
        maxwindKph: json["maxwind_kph"] == null
            ? null
            : json["maxwind_kph"].toDouble()!,
        totalprecipMm: json["totalprecip_mm"] == null
            ? null
            : json["totalprecip_mm"].toDouble()!,
        totalprecipIn: json["totalprecip_in"] == null
            ? null
            : json["totalprecip_in"].toDouble()!,
        avgvisKm:
            json["avgvis_km"] == null ? null : json["avgvis_km"].toDouble()!,
        avgvisMiles:
            json["avgvis_miles"] == null ? null : json["avgvis_miles"]!,
        avghumidity: json["avghumidity"] == null ? null : json["avghumidity"]!,
        dailyWillItRain: json["daily_will_it_rain"] == null
            ? null
            : json["daily_will_it_rain"]!,
        dailyChanceOfRain: json["daily_chance_of_rain"] == null
            ? null
            : json["daily_chance_of_rain"]!,
        dailyWillItSnow: json["daily_will_it_snow"] == null
            ? null
            : json["daily_will_it_snow"]!,
        dailyChanceOfSnow: json["daily_chance_of_snow"] == null
            ? null
            : json["daily_chance_of_snow"]!,
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        uv: json["uv"] == null ? null : json["uv"]!,
        airQuality: json["air_quality"] == null
            ? null
            : AirQuality.fromJson(json["air_quality"]),
      );

  Map<String, dynamic> toJson() => {
        "maxtemp_c": maxtempC == null ? null : maxtempC!,
        "maxtemp_f": maxtempF == null ? null : maxtempF!,
        "mintemp_c": mintempC == null ? null : mintempC!,
        "mintemp_f": mintempF == null ? null : mintempF!,
        "avgtemp_c": avgtempC == null ? null : avgtempC!,
        "avgtemp_f": avgtempF == null ? null : avgtempF!,
        "maxwind_mph": maxwindMph == null ? null : maxwindMph!,
        "maxwind_kph": maxwindKph == null ? null : maxwindKph!,
        "totalprecip_mm": totalprecipMm == null ? null : totalprecipMm!,
        "totalprecip_in": totalprecipIn == null ? null : totalprecipIn!,
        "avgvis_km": avgvisKm == null ? null : avgvisKm!,
        "avgvis_miles": avgvisMiles == null ? null : avgvisMiles!,
        "avghumidity": avghumidity == null ? null : avghumidity!,
        "daily_will_it_rain": dailyWillItRain == null ? null : dailyWillItRain!,
        "daily_chance_of_rain":
            dailyChanceOfRain == null ? null : dailyChanceOfRain!,
        "daily_will_it_snow": dailyWillItSnow == null ? null : dailyWillItSnow!,
        "daily_chance_of_snow":
            dailyChanceOfSnow == null ? null : dailyChanceOfSnow!,
        "condition": condition == null ? null : condition!.toJson(),
        "uv": uv == null ? null : uv!,
        "air_quality": airQuality == null ? null : airQuality!.toJson(),
      };
}

class AirQuality {
  AirQuality({
    this.co,
    this.no2,
    this.o3,
    this.so2,
    this.pm25,
    this.pm10,
    this.usEpaIndex,
    this.gbDefraIndex,
  });

  String? co;
  String? no2;
  String? o3;
  String? so2;
  String? pm25;
  String? pm10;
  int? usEpaIndex;
  int? gbDefraIndex;

  factory AirQuality.fromJson(Map<String, dynamic> json) => AirQuality(
        co: json["co"] == null ? null : json["co"]!,
        no2: json["no2"] == null ? null : json["no2"]!,
        o3: json["o3"] == null ? null : json["o3"]!,
        so2: json["so2"] == null ? null : json["so2"]!,
        pm25: json["pm2_5"] == null ? null : json["pm2_5"]!,
        pm10: json["pm10"] == null ? null : json["pm10"]!,
        usEpaIndex: json["us-epa-index"] == null ? null : json["us-epa-index"]!,
        gbDefraIndex:
            json["gb-defra-index"] == null ? null : json["gb-defra-index"]!,
      );

  Map<String, dynamic> toJson() => {
        "co": co == null ? null : co!,
        "no2": no2 == null ? null : no2!,
        "o3": o3 == null ? null : o3!,
        "so2": so2 == null ? null : so2!,
        "pm2_5": pm25 == null ? null : pm25!,
        "pm10": pm10 == null ? null : pm10!,
        "us-epa-index": usEpaIndex == null ? null : usEpaIndex!,
        "gb-defra-index": gbDefraIndex == null ? null : gbDefraIndex!,
      };
}

class Condition {
  Condition({
    this.text,
    this.icon,
    this.code,
  });

  String? text;
  String? icon;
  int? code;

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"] == null ? null : json["text"]!,
        icon: json["icon"] == null ? null : json["icon"]!,
        code: json["code"] == null ? null : json["code"]!,
      );

  Map<String, dynamic> toJson() => {
        "text": text == null ? null : text!,
        "icon": icon == null ? null : icon!,
        "code": code == null ? null : code!,
      };
}

class Hour {
  Hour({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.visMiles,
    this.gustMph,
    this.gustKph,
    this.uv,
    this.airQuality,
  });

  int? timeEpoch;
  String? time;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  int? willItRain;
  int? chanceOfRain;
  int? willItSnow;
  int? chanceOfSnow;
  double? visKm;
  double? visMiles;
  double? gustMph;
  double? gustKph;
  double? uv;
  AirQuality? airQuality;

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        timeEpoch: json["time_epoch"] == null ? null : json["time_epoch"]!,
        time: json["time"] == null ? null : json["time"]!,
        tempC: json["temp_c"] == null ? null : json["temp_c"].toDouble()!,
        tempF: json["temp_f"] == null ? null : json["temp_f"].toDouble()!,
        isDay: json["is_day"] == null ? null : json["is_day"]!,
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"] == null ? null : json["wind_mph"].toDouble()!,
        windKph: json["wind_kph"] == null ? null : json["wind_kph"].toDouble()!,
        windDegree: json["wind_degree"] == null ? null : json["wind_degree"]!,
        pressureMb: json["pressure_mb"] == null ? null : json["pressure_mb"]!,
        pressureIn: json["pressure_in"] == null
            ? null
            : json["pressure_in"].toDouble()!,
        precipMm:
            json["precip_mm"] == null ? null : json["precip_mm"].toDouble()!,
        precipIn:
            json["precip_in"] == null ? null : json["precip_in"].toDouble()!,
        humidity: json["humidity"] == null ? null : json["humidity"]!,
        cloud: json["cloud"] == null ? null : json["cloud"]!,
        feelslikeC: json["feelslike_c"] == null
            ? null
            : json["feelslike_c"].toDouble()!,
        feelslikeF: json["feelslike_f"] == null
            ? null
            : json["feelslike_f"].toDouble()!,
        windchillC: json["windchill_c"] == null
            ? null
            : json["windchill_c"].toDouble()!,
        windchillF: json["windchill_f"] == null
            ? null
            : json["windchill_f"].toDouble()!,
        heatindexC: json["heatindex_c"] == null
            ? null
            : json["heatindex_c"].toDouble()!,
        heatindexF: json["heatindex_f"] == null
            ? null
            : json["heatindex_f"].toDouble()!,
        dewpointC:
            json["dewpoint_c"] == null ? null : json["dewpoint_c"].toDouble()!,
        dewpointF:
            json["dewpoint_f"] == null ? null : json["dewpoint_f"].toDouble()!,
        willItRain: json["will_it_rain"] == null ? null : json["will_it_rain"]!,
        chanceOfRain:
            json["chance_of_rain"] == null ? null : json["chance_of_rain"]!,
        willItSnow: json["will_it_snow"] == null ? null : json["will_it_snow"]!,
        chanceOfSnow:
            json["chance_of_snow"] == null ? null : json["chance_of_snow"]!,
        visKm: json["vis_km"] == null ? null : json["vis_km"]!,
        visMiles: json["vis_miles"] == null ? null : json["vis_miles"]!,
        gustMph: json["gust_mph"] == null ? null : json["gust_mph"].toDouble()!,
        gustKph: json["gust_kph"] == null ? null : json["gust_kph"].toDouble()!,
        uv: json["uv"] == null ? null : json["uv"]!,
        airQuality: json["air_quality"] == null
            ? null
            : AirQuality.fromJson(json["air_quality"]),
      );

  Map<String, dynamic> toJson() => {
        "time_epoch": timeEpoch == null ? null : timeEpoch!,
        "time": time == null ? null : time!,
        "temp_c": tempC == null ? null : tempC!,
        "temp_f": tempF == null ? null : tempF!,
        "is_day": isDay == null ? null : isDay!,
        "condition": condition == null ? null : condition!.toJson(),
        "wind_mph": windMph == null ? null : windMph!,
        "wind_kph": windKph == null ? null : windKph!,
        "wind_degree": windDegree == null ? null : windDegree!,
        "pressure_mb": pressureMb == null ? null : pressureMb!,
        "pressure_in": pressureIn == null ? null : pressureIn!,
        "precip_mm": precipMm == null ? null : precipMm!,
        "precip_in": precipIn == null ? null : precipIn!,
        "humidity": humidity == null ? null : humidity!,
        "cloud": cloud == null ? null : cloud!,
        "feelslike_c": feelslikeC == null ? null : feelslikeC!,
        "feelslike_f": feelslikeF == null ? null : feelslikeF!,
        "windchill_c": windchillC == null ? null : windchillC!,
        "windchill_f": windchillF == null ? null : windchillF!,
        "heatindex_c": heatindexC == null ? null : heatindexC!,
        "heatindex_f": heatindexF == null ? null : heatindexF!,
        "dewpoint_c": dewpointC == null ? null : dewpointC!,
        "dewpoint_f": dewpointF == null ? null : dewpointF!,
        "will_it_rain": willItRain == null ? null : willItRain!,
        "chance_of_rain": chanceOfRain == null ? null : chanceOfRain!,
        "will_it_snow": willItSnow == null ? null : willItSnow!,
        "chance_of_snow": chanceOfSnow == null ? null : chanceOfSnow!,
        "vis_km": visKm == null ? null : visKm!,
        "vis_miles": visMiles == null ? null : visMiles!,
        "gust_mph": gustMph == null ? null : gustMph!,
        "gust_kph": gustKph == null ? null : gustKph!,
        "uv": uv == null ? null : uv!,
        "air_quality": airQuality == null ? null : airQuality!.toJson(),
      };
}
