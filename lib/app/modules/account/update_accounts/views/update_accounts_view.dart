import 'package:blood_bd/app/services/auth_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/request/update_req.dart';
import '../../../auth/login/views/widgets/area_dropdown.dart';
import '../../../auth/login/views/widgets/location_form.dart';
import '../../accounts/views/widget/alert_cancel_button.dart';
import '../controllers/update_accounts_controller.dart';

class UpdateAccountsView extends GetView<UpdateAccountsController> {
  UpdateAccountsView({super.key});

  final AuthCache authCache = Get.find<AuthCache>();
  final userModel = AuthCache.to.getUser()?.data;

  @override
  Widget build(BuildContext context) {

    controller.usernameTEController.text = userModel?.name ?? '';
    controller.mobileTEController.text = userModel?.mobile ?? '';
    controller.dateTEController.text = userModel?.dob?.toString() ?? '';
    controller.emailTEController.text = userModel?.email ?? '';
    controller.selectedBloodGroup.value = userModel?.bloodGroup ?? '';
    controller.selectedDivision.value = userModel?.address?.division ?? '';
    controller.selectedDistrict.value = userModel?.address?.district ?? '';
    controller.selectedUpzila.value = userModel?.address?.area ?? '';
    //controller.postOfficeTEController.text =userModel?.address?.postOffice ?? '';



    return Obx(
      ()=> AlertDialog(
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
                  if (value?.trim().isEmpty ?? true) {
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
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
