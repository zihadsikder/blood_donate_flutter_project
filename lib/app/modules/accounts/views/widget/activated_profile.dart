import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivatedProfile extends StatelessWidget {
  const ActivatedProfile({
    super.key,
    required this.testValue,
    required this.value,
    required this.onChanged,
  });

  final Text testValue;
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            testValue,
            const Spacer(),

              Switch(
                  value:value ,
                  onChanged: onChanged,),

          ],
        ),
      ),
    );
  }
}
