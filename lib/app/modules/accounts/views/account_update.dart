import 'package:blood_donate_flutter_project/app/data/models/request/update_req.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/widgets/dob_text_field.dart';
import '../../../services/auth_cache.dart';
import '../../auth/login/views/widgets/area_dropdown.dart';
import '../../auth/login/views/widgets/location_form.dart';
import 'widget/alert_cancel_button.dart';
import 'package:blood_donate_flutter_project/app/modules/accounts/controllers/accounts_controller.dart';

class AccountUpdateDialog extends StatelessWidget {
  AccountUpdateDialog({super.key});

  final controller = Get.find<AccountsController>();

  final AuthCache authCache = Get.find<AuthCache>();

  final userModel = AuthCache.to.getUser()?.data;

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
              controller: controller.usernameTEController,
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
            DobTextField(
                dbirthController: controller.dateTEController,
                onTapSuffix: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2050),
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                    controller.dateTEController.text = formattedDate;
                  }
                }),
            Container(height: 1, color: Colors.grey.shade100),
            BloodGroupDropdown(
              onSelectBloodGroup: (String? val) {
                controller.onSelectedBloodGroup(val);
              },
            ),
            const SizedBox(height: 8.0),
            Container(height: 1, color: Colors.grey.shade100),
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
        Obx(
        ()=> Visibility(
            visible: controller.inProgress.value == false,
            replacement: const Center(child: CircularProgressIndicator()),
            child: TextButton(
              onPressed: ()async {
                if(controller.formKey.currentState!.validate()){
                  final updateProfileParams = UpdateReq(
                    name: controller.usernameTEController.text,
                    mobile:'01829252747',
                    // mobile: controller.mobileTEController.text
                    //     .trim(),
                    email: 'niamot@gmail.com',
                    //email: controller.emailTEController.text,
                    dob: controller.dateTEController.text,
                    blood: controller.selectedBloodGroup.value,
                    weight: 'true',
                    address: Address(
                      divisionId: controller.selectedDivision.value,
                      districtId: controller.selectedDistrict.value,
                      areaId: controller.selectedUpzila.value,
                      postOffice: controller.selectedUnion.value,
                    ),
                  );
                  await controller.updateProfile(updateProfileParams);
                }

              },
              style: TextButton.styleFrom(backgroundColor: Colors.red.shade800),
              child: const Text('Save', style: TextStyle(color: Colors.white),),
            ),
          ),
        ),
      ],
    );
  }
}
