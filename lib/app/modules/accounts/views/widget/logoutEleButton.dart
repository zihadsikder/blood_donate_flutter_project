import 'package:flutter/material.dart';
import 'alert_cancel_button.dart';

class LogoutEleButton extends StatelessWidget {
 const LogoutEleButton({
   super.key,
   required this.onPress});

 final VoidCallback onPress;

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
                            icon: const Icon(Icons.highlight_remove_outlined))
                      ],
                    ),
                    content: const Text(
                        'Select "Logout" below if you are ready to end your current session.'),
                    actions: [
                      const AlertCancelButton(),
                      TextButton(
                        onPressed: onPress,
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.red.shade800),
                        child: const Text('Logout',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  );
                });
          },
          child: const Text('Logout')),
    );
  }
}
