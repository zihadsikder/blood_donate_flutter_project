import 'dart:convert';

MDistrictResponse mDistrictResponseFromJson(String str) => MDistrictResponse.fromJson(json.decode(str));

String mDistrictResponseToJson(MDistrictResponse data) => json.encode(data.toJson());

class MDistrictResponse {
  List<District>? data;
  String? message;

  MDistrictResponse({
    this.data,
    this.message,
  });

  factory MDistrictResponse.fromJson(Map<String, dynamic> json) => MDistrictResponse(
    data: json["data"] == null ? [] : List<District>.from(json["data"]!.map((x) => District.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class District {
  String? id;
  String? districtId;
  String? divisionId;
  String? name;
  String? bnName;
  String? lat;
  String? lon;
  String? url;
  DateTime? createdAt;
  DateTime? updatedAt;

  District({
    this.id,
    this.districtId,
    this.divisionId,
    this.name,
    this.bnName,
    this.lat,
    this.lon,
    this.url,
    this.createdAt,
    this.updatedAt,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
    id: json["_id"],
    districtId: json["district_id"],
    divisionId: json["division_id"],
    name: json["name"],
    bnName: json["bn_name"],
    lat: json["lat"],
    lon: json["lon"],
    url: json["url"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "district_id": districtId,
    "division_id": divisionId,
    "name": name,
    "bn_name": bnName,
    "lat": lat,
    "lon": lon,
    "url": url,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}