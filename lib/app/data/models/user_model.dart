import 'dart:convert';

LoginRes loginResFromJson(String str) => LoginRes.fromJson(json.decode(str));

String loginResToJson(LoginRes data) => json.encode(data.toJson());

class LoginRes {
  final int? status;
  final String? message;
  final Data? data;

  LoginRes({
    this.status,
    this.message,
    this.data,
  });

  factory LoginRes.fromJson(Map<String, dynamic> json) => LoginRes(
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
  final int? mobile;
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
  final String? accessToken;

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
    this.accessToken,
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
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        pic: json["pic"],
        accessToken: json["access_token"],
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
        "access_token": accessToken,
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
