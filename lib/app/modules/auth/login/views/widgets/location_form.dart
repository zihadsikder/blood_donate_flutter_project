import 'package:flutter/material.dart';

class BloodGroupDropdown extends StatelessWidget {
  final List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-'
  ];
  final void Function(String?)? onSelectBloodGroup;
  final String? Function(String?)? validator;
  final String labelText;

  BloodGroupDropdown({
    super.key,
    this.onSelectBloodGroup,
    this.validator,
  required this.labelText,
  });

  @override
  Widget build(BuildContext context) => DropdownButtonFormField<String>(
        decoration:  InputDecoration(
          labelText: labelText,
          //labelStyle: TextStyle(fontSize: 18),
        ),
        onChanged: onSelectBloodGroup,
        items: bloodGroups.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        validator: validator
      );
}
