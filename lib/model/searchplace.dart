import 'dart:convert';

List<Searchplace> searchplaceFromJson(String str) => List<Searchplace>.from(
    json.decode(str).map((x) => Searchplace.fromJson(x)));

String searchplaceToJson(List<Searchplace> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Searchplace {
  Searchplace({
    this.id,
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.url,
  });

  int? id;
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? url;

  factory Searchplace.fromJson(Map<String, dynamic> json) => Searchplace(
        id: json["id"] == null ? null : json["id"]!,
        name: json["name"] == null ? null : json["name"]!,
        region: json["region"] == null ? null : json["region"]!,
        country: json["country"] == null ? null : json["country"]!,
        lat: json["lat"] == null ? null : json["lat"].toDouble()!,
        lon: json["lon"] == null ? null : json["lon"].toDouble()!,
        url: json["url"] == null ? null : json["url"]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id!,
        "name": name == null ? null : name!,
        "region": region == null ? null : region!,
        "country": country == null ? null : country!,
        "lat": lat == null ? null : lat!,
        "lon": lon == null ? null : lon!,
        "url": url == null ? null : url!,
      };
}
