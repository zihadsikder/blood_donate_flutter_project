import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/user_model.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/auth_cache.dart';
import '../../../../services/network.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController numberTEController = TextEditingController();

  final obscureText = false.obs;

  final isLoading = false.obs;

  final connectivityController = Get.find<ConnectivityController>();

  @override
  void onInit() {
    super.onInit();
    connectivityController;
  }

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
        Get.toNamed(Routes.BOTTOM_NAV);
        Get.snackbar('Message', response.message ?? 'Try Again Later');
      }
    }
  }
}
