import 'package:flutter/material.dart';

class BloodGroupDropdown extends StatelessWidget {
  final List<String> bloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  final void Function(String?)? onSelectBloodGroup;

  BloodGroupDropdown({
    super.key,
    this.onSelectBloodGroup,
  });

  @override
  Widget build(BuildContext context) => DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          labelText: 'Select Blood Group',
          //labelStyle: TextStyle(fontSize: 18),
        ),
        onChanged: onSelectBloodGroup,
        items: bloodGroups.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
}
