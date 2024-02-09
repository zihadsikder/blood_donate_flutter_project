class RegistrationReq {
  final String name;
  final String mobile;
  final String email;
  final String dob;
  final String blood;
  final String weight;
  final String password;
  final Address address; // Add address field

  RegistrationReq({
    required this.name,
    required this.mobile,
    required this.email,
    required this.dob,
    required this.blood,
    required this.weight,
    required this.password,
    required this.address, // Add address field
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "mobile": mobile,
      "email": email,
      "dob": dob,
      "blood_group": blood,
      "is_weight_50kg": weight,
      "address": address.toJson(), // Convert address to JSON
      "password": password,
    };
  }
}

class Address {
  String divisionId;
  String districtId;
  String areaId;
  String postOffice;

  Address({
    required this.divisionId,
    required this.districtId,
    required this.areaId,
    required this.postOffice,
  });

  Map<String, dynamic> toJson() {
    return {
      "division_id": divisionId,
      "district_id": districtId,
      "area_id": areaId,
      "post_office": postOffice,
    };
  }
}

