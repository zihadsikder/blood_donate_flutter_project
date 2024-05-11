import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/request/update_req.dart';
import '../../../auth/login/views/widgets/area_dropdown.dart';
import '../../../auth/login/views/widgets/location_form.dart';
import '../../accounts/views/widget/alert_cancel_button.dart';
import '../controllers/update_accounts_controller.dart';

class UpdateAccountsView extends GetView<UpdateAccountsController> {
   const UpdateAccountsView({super.key});

   @override
  Widget build(BuildContext context) {

    return Obx(
      () => AlertDialog(
        title: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Row(
                children: [
                  const Text("Update Your Profile",
                      style: TextStyle(fontSize: 16)),
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
              BloodGroupDropdown(
                labelText:controller.profileData.value.data?.bloodGroup ?? '',
                onSelectBloodGroup: (String? val) {
                  controller.onSelectedBloodGroup(val);
                },
              ),
              const SizedBox(height: 8.0),
              Container(height: 1, color: Colors.grey.shade100),
              AreaDropDown(
                label:
                    controller.profileData.value.data?.address?.division?.toString() ?? '',
                onChanged: (String? val) {
                  controller.onSelectedDivision(val);
                },
                items: controller.divisionList,
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Please Select division';
                  }
                  return null;
                },
              ),
              AreaDropDown(
                label: 'select district',
                onChanged: (String? val) {
                  controller.onSelectedDistrict(val);
                },
                items: controller.districtList,
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Please Select district';
                  }
                  return null;
                },
              ),
              AreaDropDown(
                label: 'select area',
                onChanged: (String? val) {
                  controller.onSelectedUpzila(val);
                },
                items: controller.upzilaList,
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Please Select area';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: controller.postOfficeTEController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                ),
                validator: (String? value) {
                  if (value?.trim().isNotEmpty ?? true) {
                    return 'Enter your address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
            ],
          ),
        ),
        actions: [
          const AlertCancelButton(),
          Visibility(
            visible: controller.inProgress.value == false,
            replacement: const Center(child: CircularProgressIndicator()),
            child: TextButton(
              onPressed: () async {
                if (controller.formKey.currentState!.validate()) {
                  final updateProfileParams = UpdateReq(
                    name: controller.usernameTEController.text,
                    mobile: controller.mobileTEController.text.trim(),
                    email: controller.emailTEController.text,
                    dob: controller.dateTEController.text,
                    blood: controller.selectedBloodGroup.value,
                    weight: 'true',
                    address: Address(
                      divisionId: controller.selectedDivision.value,
                      districtId: controller.selectedDistrict.value,
                      areaId: controller.selectedUpzila.value,
                      postOffice: controller.postOfficeTEController.text,
                    ),
                  );
                  await controller.updateProfile(updateProfileParams);
                }
              },
              style: TextButton.styleFrom(backgroundColor: Colors.red.shade800),
              child: const Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
