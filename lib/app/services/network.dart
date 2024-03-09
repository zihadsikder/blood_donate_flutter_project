import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {


    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
        messageText: const Text(
          'PLEASE CONNECT TO THE INTERNET',
          style: TextStyle(color: Colors.white),
        ),
        isDismissible: false,
        duration: const Duration(days: 1),
        backgroundColor: Colors.black54,
        icon: const Icon(Icons.wifi_off, color: Colors.white, size: 35,),
        margin: EdgeInsets.zero,
        snackStyle: SnackStyle.GROUNDED,
        snackPosition: SnackPosition.TOP
      );
    } else {
      if (Get.isSnackbarOpen) {
          Get.closeCurrentSnackbar();
      }
    }
  }
}