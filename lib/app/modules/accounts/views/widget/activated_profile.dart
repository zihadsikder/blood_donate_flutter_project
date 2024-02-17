import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/accounts_controller.dart';

class ActivatedProfile extends StatelessWidget {
ActivatedProfile({
    super.key,});

  final controller = Get.find<AccountsController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              controller.isProfileActive.value ? 'Deactivate Your Account' : 'Activate Your Account',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const Spacer(),
            Obx(() {
                return Switch(
                    value: controller.isProfileActive.value,
                    onChanged: (isActive) async {
                      controller.isProfileActive.value = isActive;
                      await controller.toggleProfileActivation(isActive);
                      // if(success){
                      //   controller.isProfileActive.value = isActive;
                      // }else{
                      //   controller.failMessage = 'Something Went Wrong!';
                      // }

                    });
              }
            )
          ],
        ),
      ),
    );
  }
}