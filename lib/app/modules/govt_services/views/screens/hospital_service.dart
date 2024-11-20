import 'package:flutter/material.dart';

class HospitalService extends StatelessWidget {
  const HospitalService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital Services'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Upcoming...")
          ],
        ),
      ),
    );
  }
}
