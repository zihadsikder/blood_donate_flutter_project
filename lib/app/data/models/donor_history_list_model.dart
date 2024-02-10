
import 'dart:convert';

DonorHistoryList donorHistoryListFromJson(String str) => DonorHistoryList.fromJson(json.decode(str));

String donorHistoryListToJson(DonorHistoryList data) => json.encode(data.toJson());

class DonorHistoryList {
  Pagination? pagination;
  List<Datum>? data;
  int? status;
  String? message;

  DonorHistoryList({
    this.pagination,
    this.data,
    this.status,
    this.message,
  });

  factory DonorHistoryList.fromJson(Map<String, dynamic> json) => DonorHistoryList(
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
  DateTime? donationDate;
  String? donationPlace;
  String? donarName;
  String? donarId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.donationDate,
    this.donationPlace,
    this.donarName,
    this.donarId,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    donationDate: json["donation_date"] == null ? null : DateTime.parse(json["donation_date"]),
    donationPlace: json["donation_place"],
    donarName: json["donar_name"],
    donarId: json["donar_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "donation_date": donationDate?.toIso8601String(),
    "donation_place": donationPlace,
    "donar_name": donarName,
    "donar_id": donarId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
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