import 'package:flutter/material.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
         const Text('আসলামুআলাইকুম'),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const  Icon(Icons.cancel_outlined),
          ),
        ],
      ),
      content: const Text('এই এ্যাপস টিতে আমরা সম্পূর্ণ বিনামূল্যে সেবা প্রদান করে থাকি। এ্যাপস পরিচালনায় আপনাদের সামান্য অবদান আমাদের কাছে অনেক গুরুত্বপূর্ণ |'),

    );
  }
}
