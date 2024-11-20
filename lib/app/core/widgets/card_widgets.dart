import 'package:blood_bd/app/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class CardWidgets extends StatelessWidget {
  const CardWidgets({super.key, required this.tittle, required this.onTap});

  final String tittle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(tittle,
                    style: AppTextStyles.textStyle(color: Colors.black),
                    overflow: TextOverflow.ellipsis),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
