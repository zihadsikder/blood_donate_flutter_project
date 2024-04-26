import 'package:flutter/material.dart';

import '../../../../../data/models/area_res.dart';

class AreaDropDown extends StatelessWidget {
   const AreaDropDown({
    super.key,
    required this.label,
    this.onChanged,
    this.validator,
    this.items = const <AreaModel>[],
  });


  final String label;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final List<AreaModel> items;

  @override
  Widget build(BuildContext context) {
    return items.isNotEmpty
        ? DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: label,
            ),
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<String>>((AreaModel value) {
              return DropdownMenuItem<String>(
                value: value.id,
                child: Text(value.name!),
              );
            }).toList(),
            validator: validator,
          )
        : const SizedBox();
  }
}
