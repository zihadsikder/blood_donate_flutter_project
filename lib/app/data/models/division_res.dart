import 'dart:convert';

DivisionResponse divisionFromJson(String str) => DivisionResponse.fromJson(json.decode(str));

String divisionToJson(DivisionResponse data) => json.encode(data.toJson());

class DivisionResponse {
  int status;
  String message;
  List<Division> data;

  DivisionResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DivisionResponse.fromJson(Map<String, dynamic> json) => DivisionResponse(
    status: json["status"],
    message: json["message"],
    data: List<Division>.from(json["data"].map((x) => Division.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Division {
  String id;
  String divisionId;
  String divisionCode;
  String name;
  String bnName;
  String coordinates;
  String url;
  DateTime createdAt;
  DateTime updatedAt;

  Division({
    required this.id,
    required this.divisionId,
    required this.divisionCode,
    required this.name,
    required this.bnName,
    required this.coordinates,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Division.fromJson(Map<String, dynamic> json) => Division(
    id: json["_id"],
    divisionId: json["division_id"],
    divisionCode: json["division_code"],
    name: json["name"],
    bnName: json["bn_name"],
    coordinates: json["coordinates"],
    url: json["url"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "division_id": divisionId,
    "division_code": divisionCode,
    "name": name,
    "bn_name": bnName,
    "coordinates": coordinates,
    "url": url,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}