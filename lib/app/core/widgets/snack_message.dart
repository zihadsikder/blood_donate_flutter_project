import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackMessage({
  String? title,
  required String message,
  Color? color,
}) {
  Get.showSnackbar(
    GetSnackBar(
        title: title,
        message: message,
        snackStyle: SnackStyle.GROUNDED,
        duration: const Duration(seconds: 1),
        backgroundColor: color ?? Colors.orange),
  );
}
