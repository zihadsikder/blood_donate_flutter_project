import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controllers/network_activity_controller.dart';

class NetworkActivityView extends GetView<NetworkActivityController> {
  const NetworkActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.isConnected,
      builder: (context, value, child) {
        if (value) {
          return const SizedBox(); // No need to show anything if connected
        } else {
          return Container(
            color: Colors.red,
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              children: [
                Icon(Icons.warning, color: Colors.white),
                SizedBox(width: 8.0),
                Text(
                  'Check Your Internet Connection!',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}