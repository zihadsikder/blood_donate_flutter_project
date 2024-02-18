import 'package:blood_donate_flutter_project/app/modules/home/controllers/home_controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../auth/login/views/widgets/area_dropdown.dart';
import '../../auth/login/views/widgets/location_form.dart';

import 'widgets/donor_card_.dart';

class SearchScreenView extends StatelessWidget {
  SearchScreenView({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    controller.getDivision();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find A Blood Donor"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: controller.formKey,
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: controller.isLoading.value == false,
                      replacement:
                          const Center(child: CircularProgressIndicator()),
                      child: ElevatedButton(
                        onPressed: () => controller.searchDonor(
                            controller.selectedBloodGroup.value,
                            controller.selectedDivision.value,
                            controller.selectedDistrict.value,
                            controller.selectedUpzila.value,
                            controller.selectedUnion.value),
                        child: const Text('Search'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.searchUser.value.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final donor = controller.searchUser.value.data?[index];
                      if (donor != null) {
                        String formattedLastDonation =
                            donor.lastDonation != null
                                ? DateFormat('dd-MM-yyyy')
                                    .format(donor.lastDonation!.toLocal())
                                : "N/A";
                        return SearchDonorPage(
                          name: donor.name ?? '',
                          bloodGroup: donor.bloodGroup ?? '',
                          lastDonation: formattedLastDonation,
                          totalDonations: donor.totalDonation?.toString() ?? '',
                          mobile: donor.mobile?.toString() ?? '',
                          address: donor.address?.postOffice ?? '',
                          isEligibleToDonate: false,
                        );
                      } else {
                        return Container(); // Or you can return a placeholder widget
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
