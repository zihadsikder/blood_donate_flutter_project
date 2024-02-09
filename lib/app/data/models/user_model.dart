import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int status;
  String message;
  Data data;

  UserModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String id;
  String name;
  String email;
  DateTime dob;
  String occupation;
  String bloodGroup;
  Address address;
  bool isWeight50Kg;
  DateTime lastDonation;
  String pic;
  String accessToken;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.dob,
    required this.occupation,
    required this.bloodGroup,
    required this.address,
    required this.isWeight50Kg,
    required this.lastDonation,
    required this.pic,
    required this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    dob: DateTime.parse(json["dob"]),
    occupation: json["occupation"],
    bloodGroup: json["blood_group"],
    address: Address.fromJson(json["address"]),
    isWeight50Kg: json["is_weight_50kg"],
    lastDonation: DateTime.parse(json["last_donation"]),
    pic: json["pic"],
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "dob": dob.toIso8601String(),
    "occupation": occupation,
    "blood_group": bloodGroup,
    "address": address.toJson(),
    "is_weight_50kg": isWeight50Kg,
    "last_donation": lastDonation.toIso8601String(),
    "pic": pic,
    "access_token": accessToken,
  };
}

class Address {
  int divisionId;
  int districtId;
  int areaId;
  String postOffice;
  String id;

  Address({
    required this.divisionId,
    required this.districtId,
    required this.areaId,
    required this.postOffice,
    required this.id,
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
