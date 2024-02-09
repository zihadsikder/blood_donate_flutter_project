

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/district_res.dart';
import '../../../../data/models/division_res.dart';
import '../../../../data/models/request/registration_req.dart';
import '../../../../data/models/union_res.dart';
import '../../../../data/models/upzila_res.dart';

class LocationFormScreen extends StatelessWidget {
  final List<String> bloodGroups = [
    ' ',
    'A+',
    'A-',
    'AB+',
    'AB-',
    'B-',
    'B+',
    'O+',
    'O-'
  ];

  final String selectedBloodGroup;

  final String? selectedDivisionName;
  final void Function(String?)? onSelectDivision;
  final  List<Division>?  divisionList;


  final String? selectedDistrictName;
  final void Function(String?)? onSelectedDistrict;
  final List<District>? districtList;

  final String selectedUpzilaName;
  final void Function(String?)? onSelectedUpzila;
  final List<Upzila>? upzilaList;


  final String selectedUnionName;
  final void Function(String?)? onSelectedUnion;
  final List<Union>? unionList;

  final Function(String)? onBloodGroupSelected;

  LocationFormScreen({
    super.key,
    required this.selectedBloodGroup,
    required this.selectedDivisionName,
    this.onSelectDivision,
    this.divisionList,
    required this.selectedDistrictName,
    this.onSelectedDistrict,
    this.districtList,
    required this.selectedUpzilaName,
    this.onSelectedUpzila,
    this.upzilaList,
    required this.selectedUnionName,
    this.onSelectedUnion,
    this.unionList,
    required this.onBloodGroupSelected,
  });

  Address getSelectedAddress() {
    return Address(
      divisionId: selectedDivisionName?? '',
      districtId: selectedDistrictName?? '',
      areaId: selectedUpzilaName,
      postOffice: selectedUnionName,
    );
  }




  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bloodDropdownButtonFormField,
        const SizedBox(height: 4.0),

        DropdownButtonFormField<String>(
          value: selectedDivisionName,
          onChanged: onSelectDivision,
          items: divisionList
              ?.map<DropdownMenuItem<String>>((Division value) {
            return DropdownMenuItem<String>(
              value: value.divisionId,
              // Assuming divisionId is the unique identifier
              child: Text(value.name),
            );
          }).toList(),
          decoration: const InputDecoration(
            labelText: 'Select Division',
          ),
        ),
        const SizedBox(height: 4.0),

        DropdownButtonFormField<String>(
          value: selectedDistrictName,
          onChanged: onSelectedDistrict,
           //controller.getUpzila(id: newValue!),

          items: districtList
              ?.map<DropdownMenuItem<String>>((District value) {
            return DropdownMenuItem<String>(
              value: value.districtId,
              child: Text(value.name!),
            );
          }).toList(),
          decoration: const InputDecoration(
            labelText: 'Select District',
          ),
        ),
        const SizedBox(height: 4.0),

      DropdownButtonFormField<String>(
        value: selectedUpzilaName,
        onChanged: onSelectedUpzila,
        items: upzilaList
            ?.map<DropdownMenuItem<String>>((Upzila value) {
          return DropdownMenuItem<String>(
            value: value.upzilaId,
            child: Text(value.name!),
          );
        }).toList(),
        decoration: const InputDecoration(
          labelText: 'Select Upzila',
        ),
      ),
        const SizedBox(height: 4.0),

        DropdownButtonFormField<String>(
          value: selectedUnionName,
          onChanged: onSelectedUnion,
          items: unionList
              ?.map<DropdownMenuItem<String>>((Union value) {
            return DropdownMenuItem<String>(
              value: value.unionId,
              child: Text(value.name!),
            );
          }).toList(),
          decoration: const InputDecoration(
            labelText: 'Select Union',
          ),
        ),
        const SizedBox(height: 4.0),
      ],
    );
  }

  DropdownButtonFormField<String> get bloodDropdownButtonFormField {
    return DropdownButtonFormField<String>(
      value: selectedBloodGroup,
      onChanged: (newValue) {

          onBloodGroupSelected!(newValue!);

      },
      items:
      bloodGroups.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: const InputDecoration(
          labelText: 'Blood Group', labelStyle: TextStyle(fontSize: 18)),
    );
  }
}