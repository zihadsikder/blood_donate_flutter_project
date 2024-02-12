// To parse this JSON data, do
//
//     final area = areaFromJson(jsonString);

import 'dart:convert';

Area areaFromJson(String str) => Area.fromJson(json.decode(str));

String areaToJson(Area data) => json.encode(data.toJson());

class Area {
  final int? status;
  final String? message;
  final List<AreaModel>? data;

  Area({
    this.status,
    this.message,
    this.data,
  });

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<AreaModel>.from(json["data"]!.map((x) => AreaModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AreaModel {
  final String? id;
  final String? name;
  final String? bnName;
  final String? lat;
  final String? lon;
  final String? url;

  AreaModel({
    this.id,
    this.name,
    this.bnName,
    this.lat,
    this.lon,
    this.url,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
        id: json["id"],
        name: json["name"],
        bnName: json["bn_name"],
        lat: json["lat"],
        lon: json["lon"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "bn_name": bnName,
        "lat": lat,
        "lon": lon,
        "url": url,
      };
}
