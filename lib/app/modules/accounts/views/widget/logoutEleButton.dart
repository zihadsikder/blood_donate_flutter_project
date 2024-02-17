import 'package:blood_donate_flutter_project/app/modules/accounts/controllers/accounts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'alert_cancel_button.dart';

class LogoutEleButton extends StatelessWidget {
 LogoutEleButton({super.key});

 final controller = Get.find<AccountsController>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
                      onPressed: ()=> controller.logout(),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.red.shade800),
                      child: const Text('Logout',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                );
              });
        },
        child: const Text('Logout'));
  }
}
