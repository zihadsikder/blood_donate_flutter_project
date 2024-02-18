import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/login/views/widgets/area_dropdown.dart';
import '../../auth/login/views/widgets/location_form.dart';
import 'widget/alert_cancel_button.dart';
import 'package:blood_donate_flutter_project/app/modules/accounts/controllers/accounts_controller.dart';

class AccountUpdateDialog extends StatelessWidget {
  AccountUpdateDialog({super.key});

  final controller = Get.find<AccountsController>();

  @override
  Widget build(BuildContext context) {
    controller.getDivision();
    return AlertDialog(
      title: Form(
        key: controller.formKey,
        child: Column(
          children: [
            Row(
              children: [
                const Text("Edit Your Profile", style: TextStyle(fontSize: 16)),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.highlight_remove_outlined),
                )
              ],
            ),
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
            ),
            Container(height: 1, color: Colors.grey.shade100),
            TextFormField(
              controller: controller.mobileTEController,
              decoration: const InputDecoration(
                hintText: ('Number'),
              ),
            ),
            Container(height: 1, color: Colors.grey.shade100),
            BloodGroupDropdown(
              onSelectBloodGroup: (String? val) {
                controller.onSelectedBloodGroup(val);
              },
            ),
            const SizedBox(height: 8.0),
            AreaDropDown(
              label: 'select division',
              onChanged: (String? val) {
                controller.onSelectedDivision(val);
              },
              items: controller.divisionList,
            ),
            AreaDropDown(
              label: 'select district',
              onChanged: (String? val) {
                controller.onSelectedDistrict(val);
              },
              items: controller.districtList,
            ),
            AreaDropDown(
              label: 'select upzila',
              onChanged: (String? val) {
                controller.onSelectedUpzila(val);
              },
              items: controller.upzilaList,
            ),
            AreaDropDown(
              label: 'select union',
              onChanged: (String? val) {
                controller.onSelectedUnion(val);
              },
              items: controller.unionList,
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
      actions: [
        const AlertCancelButton(),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(backgroundColor: Colors.red.shade800),
          child: const Text('Save', style: TextStyle(color: Colors.white),),
        ),
      ],
    );
  }
}
