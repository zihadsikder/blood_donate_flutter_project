import 'dart:convert';

MSearchUserModel mSearchUserModelFromJson(String str) => MSearchUserModel.fromJson(json.decode(str));

String mSearchUserModelToJson(MSearchUserModel data) => json.encode(data.toJson());

class MSearchUserModel {
  Pagination? pagination;
  List<Datum>? data;
  int? status;
  String? message;

  MSearchUserModel({
    this.pagination,
    this.data,
    this.status,
    this.message,
  });

  factory MSearchUserModel.fromJson(Map<String, dynamic> json) => MSearchUserModel(
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "pagination": pagination?.toJson(),
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Datum {
  String? id;
  String? name;
  int? mobile;
  String? email;
  DateTime? dob;
  String? bloodGroup;
  String? occupation;
  bool? isWeight50Kg;
  DateTime? lastDonation;
  Address? address;
  String? pic;
  DateTime? datumCreatedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.dob,
    this.bloodGroup,
    this.occupation,
    this.isWeight50Kg,
    this.lastDonation,
    this.address,
    this.pic,
    this.datumCreatedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    bloodGroup: json["blood_group"],
    occupation: json["occupation"],
    isWeight50Kg: json["is_weight_50kg"],
    lastDonation: json["last_donation"] == null ? null : DateTime.parse(json["last_donation"]),
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    pic: json["pic"],
    datumCreatedAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "mobile": mobile,
    "email": email,
    "dob": dob?.toIso8601String(),
    "blood_group": bloodGroup,
    "occupation": occupation,
    "is_weight_50kg": isWeight50Kg,
    "last_donation": lastDonation?.toIso8601String(),
    "address": address?.toJson(),
    "pic": pic,
    "created_at": datumCreatedAt?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Address {
  int? divisionId;
  int? districtId;
  int? areaId;
  String? postOffice;
  String? id;

  Address({
    this.divisionId,
    this.districtId,
    this.areaId,
    this.postOffice,
    this.id,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    divisionId: json["division_id"],
    districtId: json["district_id"],
    areaId: json["area_id"],
    postOffice: json["post_office"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "division_id": divisionId,
    "district_id": districtId,
    "area_id": areaId,
    "post_office": postOffice,
    "_id": id,
  };
}

class Pagination {
  int? totalData;
  int? totalPage;
  int? currentPage;
  int? dataLoadCurrentPage;

  Pagination({
    this.totalData,
    this.totalPage,
    this.currentPage,
    this.dataLoadCurrentPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    totalData: json["total_data"],
    totalPage: json["total_page"],
    currentPage: json["current_page"],
    dataLoadCurrentPage: json["data_load_current_page"],
  );

  Map<String, dynamic> toJson() => {
    "total_data": totalData,
    "total_page": totalPage,
    "current_page": currentPage,
    "data_load_current_page": dataLoadCurrentPage,
  };
}