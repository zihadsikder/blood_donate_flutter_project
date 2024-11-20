import 'package:flutter/material.dart';

import '../../../../core/config/app_colors.dart';

class ListTitleWidgets extends StatelessWidget {
  const ListTitleWidgets({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.trailingIcon,
  });

  final IconData icon;
  final IconData? trailingIcon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      leading: Icon(icon, color: AppColors.bgColor),
      title: Text(
        text,
        style: const TextStyle(overflow: TextOverflow.ellipsis),
      ),
      onTap: onTap,
      trailing: trailingIcon != null
          ? Icon(trailingIcon, size: 20)
          : null, // Conditionally render the trailing icon
    );
  }
}
