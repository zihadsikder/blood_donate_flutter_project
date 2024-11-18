import 'package:flutter/material.dart';

class AccountsInfo extends StatelessWidget {
  const AccountsInfo({
    super.key,
    required this.value,
    required this.text,
    required this.icon,
  });
final IconData icon;
  final String value;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
            width: 2, color: Colors.white),
        borderRadius: BorderRadius.circular(5),
      ),
      leading: Icon(
        icon,
        color: Colors.red.shade700,
        size: 30,
      ),
      title: Row(
        children: [
          Text(text),
        ],
      ),
      subtitle: Text(
        value
         ),
    );
  }
}
