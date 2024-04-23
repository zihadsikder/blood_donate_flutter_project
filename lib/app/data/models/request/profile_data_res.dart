// To parse this JSON data, do
//
//     final profileData = profileDataFromJson(jsonString);

import 'dart:convert';

ProfileData profileDataFromJson(String str) => ProfileData.fromJson(json.decode(str));

String profileDataToJson(ProfileData data) => json.encode(data.toJson());

class ProfileData {
  final int? status;
  final String? message;
  final Data? data;

  ProfileData({
    this.status,
    this.message,
    this.data,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final String? id;
  final String? name;
  final String? mobile;
  final String? email;
  final DateTime? dob;
  final String? occupation;
  final String? bloodGroup;
  final bool? isAvailable;
  final bool? isActive;
  final bool? isWeight50Kg;
  final dynamic lastDonation;
  final Address? address;
  final String? pic;

  Data({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.dob,
    this.occupation,
    this.bloodGroup,
    this.isAvailable,
    this.isActive,
    this.isWeight50Kg,
    this.lastDonation,
    this.address,
    this.pic,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    occupation: json["occupation"],
    bloodGroup: json["blood_group"],
    isAvailable: json["isAvailable"],
    isActive: json["isActive"],
    isWeight50Kg: json["is_weight_50kg"],
    lastDonation: json["last_donation"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    pic: json["pic"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "mobile": mobile,
    "email": email,
    "dob": dob?.toIso8601String(),
    "occupation": occupation,
    "blood_group": bloodGroup,
    "isAvailable": isAvailable,
    "isActive": isActive,
    "is_weight_50kg": isWeight50Kg,
    "last_donation": lastDonation,
    "address": address?.toJson(),
    "pic": pic,
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
