// To parse this JSON data, do
//
//     final astronomyModel = astronomyModelFromJson(jsonString);

import 'dart:convert';

AstronomyModel astronomyModelFromJson(String str) =>
    AstronomyModel.fromJson(json.decode(str));

String astronomyModelToJson(AstronomyModel data) => json.encode(data.toJson());

class AstronomyModel {
  AstronomyModel({
    this.location,
    this.astronomy,
  });

  Location? location;
  Astronomy? astronomy;

  factory AstronomyModel.fromJson(Map<String, dynamic> json) => AstronomyModel(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        astronomy: json["astronomy"] == null
            ? null
            : Astronomy.fromJson(json["astronomy"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location == null ? null : location!.toJson(),
        "astronomy": astronomy == null ? null : astronomy!.toJson(),
      };
}

class Astronomy {
  Astronomy({
    this.astro,
  });

  Astro? astro;

  factory Astronomy.fromJson(Map<String, dynamic> json) => Astronomy(
        astro: json["astro"] == null ? null : Astro.fromJson(json["astro"]),
      );

  Map<String, dynamic> toJson() => {
        "astro": astro == null ? null : astro!.toJson(),
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

class Location {
  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"] == null ? null : json["name"]!,
        region: json["region"] == null ? null : json["region"]!,
        country: json["country"] == null ? null : json["country"]!,
        lat: json["lat"] == null ? null : json["lat"].toDouble()!,
        lon: json["lon"] == null ? null : json["lon"].toDouble()!,
        tzId: json["tz_id"] == null ? null : json["tz_id"]!,
        localtimeEpoch:
            json["localtime_epoch"] == null ? null : json["localtime_epoch"]!,
        localtime: json["localtime"] == null ? null : json["localtime"]!,
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name!,
        "region": region == null ? null : region!,
        "country": country == null ? null : country!,
        "lat": lat == null ? null : lat!,
        "lon": lon == null ? null : lon!,
        "tz_id": tzId == null ? null : tzId!,
        "localtime_epoch": localtimeEpoch == null ? null : localtimeEpoch!,
        "localtime": localtime == null ? null : localtime!,
      };
}
