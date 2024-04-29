import 'package:flutter/material.dart';

class DobTextField extends StatelessWidget {
  const DobTextField({
    super.key,
    required this.dbirthController,
    required this.onTapSuffix,
    required this.labelText,


  });

  final TextEditingController dbirthController;
  final String labelText;
  final VoidCallback onTapSuffix;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dbirthController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: IconButton(
          onPressed: onTapSuffix,
          icon: const Icon(Icons.calendar_today, color: Colors.grey),
        ),
      ),
      keyboardType: TextInputType.datetime,
      validator: (String? value) {
        if (value?.trim().isEmpty ?? true) {
          return 'Enter your Date of Birth';
        }
        return null;
      },
    );
  }
}