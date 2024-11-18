import 'package:blood_bd/app/core/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'alert_cancel_button.dart';

class LogoutEleButton extends StatefulWidget {
  const LogoutEleButton({
    super.key,
    required this.onPress,
  });

  final VoidCallback onPress;

  @override
  State<LogoutEleButton> createState() => _LogoutEleButtonState();
}

class _LogoutEleButtonState extends State<LogoutEleButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Row(
                      children: [
                        const Text("Ready to Leave?",
                            style: TextStyle(fontSize: 16)),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.highlight_remove_outlined,color: AppColors.bgColor,))
                      ],
                    ),
                    content: const Text(
                        'Select "Logout" below if you are ready to end your current session.'),
                    actions: [
                      const AlertCancelButton(),
                      TextButton(
                        onPressed: widget.onPress,
                        style: TextButton.styleFrom(
                            backgroundColor: AppColors.buttonColor),
                        child: const Text('Logout',
                            style: TextStyle(color: AppColors.secondaryColor)),
                      ),
                    ],
                  );
                });
          },
          child: const Text('Logout')),
    );
  }
}
