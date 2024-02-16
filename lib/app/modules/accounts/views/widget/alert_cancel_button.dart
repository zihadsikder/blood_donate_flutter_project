import 'package:flutter/material.dart';

class AlertCancelButton extends StatelessWidget {
  const AlertCancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      Navigator.pop(context);
    },
      style: TextButton.styleFrom(
          backgroundColor: Colors.redAccent.shade200
      ), child: const Text('Cancel',style: TextStyle(color: Colors.white)),);
  }
}