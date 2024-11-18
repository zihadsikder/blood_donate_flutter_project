import 'package:flutter/material.dart';

import '../../../../core/config/app_colors.dart';

class ListTitleWidgets extends StatelessWidget {
  const ListTitleWidgets({
    super.key, required this.icon, required this.text, required this.onTap,
  });

  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      leading: Icon(icon,
          color: AppColors.bgColor),
      title: Text(text),
      onTap: onTap,
      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
    );
  }
}
