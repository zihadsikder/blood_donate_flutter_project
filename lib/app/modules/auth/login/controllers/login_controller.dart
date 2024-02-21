import 'package:blood_donate_flutter_project/app/data/repositories/auth_repository.dart';
import 'package:blood_donate_flutter_project/app/services/auth_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/user_model.dart';
import '../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController numberTEController = TextEditingController();

  final obscureText = true.obs;

  final isLoading = false.obs;

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
    isLoading.value = true;

    final mobile = numberTEController.text.trim();
    final password = passwordTEController.text.trim();

    final response = await AuthRepository.login(mobile, password);
    isLoading.value = false;

    if (response.isSuccess && response.jsonResponse != null) {
      LoginRes loginRes = loginResFromJson(response.jsonResponse!);

      AuthCache.to.saveUserInformation(
        loginRes.data?.accessToken ?? '',
        loginRes,
      );
      isLoading.value = true;
      Get.toNamed(Routes.BOTTOM_NAV);

    } else {
      Get.snackbar('Error', 'Try Again Later');
      isLoading.value = false;
    }
  }
  }
}
