import 'package:blood_donate_flutter_project/app/data/models/area_res.dart';
import 'package:flutter/material.dart';

class AreaDropDown extends StatelessWidget {
  const AreaDropDown({
    super.key,
    required this.label,
    this.onChanged,
    this.items = const <AreaModel>[],
  });

  final String label;
  final void Function(String?)? onChanged;
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
          )
        : const SizedBox();
  }
}
