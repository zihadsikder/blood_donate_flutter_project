import 'package:flutter/material.dart';

class AmbulanceServices extends StatelessWidget {
  const AmbulanceServices({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Ambulance Services'),
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
