import 'package:flutter/material.dart';

import '../../../../../core/config/app_colors.dart';

class DonationInfo extends StatelessWidget {
  const DonationInfo({
    super.key,
    required this.value,
    required this.text,
  });

  final String value;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(
            Icons.bloodtype_outlined,
            color: AppColors.bgColor,
          ),
          const SizedBox(height: 5),
          Text(
            value,
          ),
          //const Text('2'),
          Text(text),
        ],
      ),
    );
  }
}
