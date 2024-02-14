import 'dart:convert';

SearchUserModel searchUserModelFromJson(String str) => SearchUserModel.fromJson(json.decode(str));

String searchUserModelToJson(SearchUserModel data) => json.encode(data.toJson());

class SearchUserModel {
  final Pagination? pagination;
  final List<Datum>? data;
  final int? status;
  final String? message;

  SearchUserModel({
    this.pagination,
    this.data,
    this.status,
    this.message,
  });

  factory SearchUserModel.fromJson(Map<String, dynamic> json) => SearchUserModel(
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
  final String? id;
  final String? name;
  final int? mobile;
  final String? email;
  final DateTime? dob;
  final String? bloodGroup;
  final bool? isWeight50Kg;
  final DateTime? lastDonation;
  final Address? address;
  final String? pic;
  final DateTime? createdAt;
  final String? occupation;
  final int? totalDonation;

  Datum({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.dob,
    this.bloodGroup,
    this.isWeight50Kg,
    this.lastDonation,
    this.address,
    this.pic,
    this.createdAt,
    this.occupation,
    this.totalDonation,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    bloodGroup: json["blood_group"],
    isWeight50Kg: json["is_weight_50kg"],
    lastDonation: json["last_donation"] == null ? null : DateTime.parse(json["last_donation"]),
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    pic: json["pic"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    occupation: json["occupation"],
    totalDonation: json["totalDonation"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "mobile": mobile,
    "email": email,
    "dob": dob?.toIso8601String(),
    "blood_group": bloodGroup,
    "is_weight_50kg": isWeight50Kg,
    "last_donation": lastDonation?.toIso8601String(),
    "address": address?.toJson(),
    "pic": pic,
    "created_at": createdAt?.toIso8601String(),
    "occupation": occupation,
    "totalDonation": totalDonation,
  };
}

class Address {
  final String? division;
  final String? district;
  final String? area;
  final String? postOffice;

  Address({
    this.division,
    this.district,
    this.area,
    this.postOffice,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    division: json["division"],
    district: json["district"],
    area: json["area"],
    postOffice: json["post_office"],
  );

  Map<String, dynamic> toJson() => {
    "division": division,
    "district": district,
    "area": area,
    "post_office": postOffice,
  };
}

class Pagination {
  final int? totalData;
  final int? totalPage;
  final int? currentPage;
  final int? dataLoadCurrentPage;

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
