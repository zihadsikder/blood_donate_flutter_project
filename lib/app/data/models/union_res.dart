import 'dart:convert';

UnionResponse unionResponseFromJson(String str) => UnionResponse.fromJson(json.decode(str));

String unionResponseToJson(UnionResponse data) => json.encode(data.toJson());

class UnionResponse {
  int? status;
  String? message;
  List<Union>? data;

  UnionResponse({
    this.status,
    this.message,
    this.data,
  });

  factory UnionResponse.fromJson(Map<String, dynamic> json) => UnionResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Union>.from(json["data"]!.map((x) => Union.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Union {
  String? id;
  String? unionId;
  String? upzilaId;
  String? name;
  String? bnName;
  String? url;
  DateTime? createdAt;
  DateTime? updatedAt;

  Union({
    this.id,
    this.unionId,
    this.upzilaId,
    this.name,
    this.bnName,
    this.url,
    this.createdAt,
    this.updatedAt,
  });

  factory Union.fromJson(Map<String, dynamic> json) => Union(
    id: json["_id"],
    unionId: json["union_id"],
    upzilaId: json["upzila_id"],
    name: json["name"],
    bnName: json["bn_name"],
    url: json["url"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "union_id": unionId,
    "upzila_id": upzilaId,
    "name": name,
    "bn_name": bnName,
    "url": url,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}