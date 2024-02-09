

import 'dart:convert';

UpzilaResponse upzilaResponseFromJson(String str) => UpzilaResponse.fromJson(json.decode(str));

String upzilaResponseToJson(UpzilaResponse data) => json.encode(data.toJson());

class UpzilaResponse {
  List<Upzila>? data;
  String? message;

  UpzilaResponse({
    this.data,
    this.message,
  });

  factory UpzilaResponse.fromJson(Map<String, dynamic> json) => UpzilaResponse(
    data: json["data"] == null ? [] : List<Upzila>.from(json["data"]!.map((x) => Upzila.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Upzila {
  String? id;
  String? upzilaId;
  String? districtId;
  String? name;
  String? bnName;
  String? url;
  DateTime? createdAt;
  DateTime? updatedAt;

  Upzila({
    this.id,
    this.upzilaId,
    this.districtId,
    this.name,
    this.bnName,
    this.url,
    this.createdAt,
    this.updatedAt,
  });

  factory Upzila.fromJson(Map<String, dynamic> json) => Upzila(
    id: json["_id"],
    upzilaId: json["upzila_id"],
    districtId: json["district_id"],
    name: json["name"],
    bnName: json["bn_name"],
    url: json["url"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "upzila_id": upzilaId,
    "district_id": districtId,
    "name": name,
    "bn_name": bnName,
    "url": url,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}