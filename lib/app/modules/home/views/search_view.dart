import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../auth/login/views/widgets/area_dropdown.dart';
import '../../auth/login/views/widgets/location_form.dart';

import '../controllers/home_controller.dart';
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
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.red.shade800,
            statusBarIconBrightness: Brightness.light),
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
              labelText:'Select Blood Group',
                    onSelectBloodGroup: (String? val) {
                      controller.onSelectedBloodGroup(val);
                    },
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Please Select blood group';
                      }
                      return null;
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
                    label: 'select area',
                    onChanged: (String? val) {
                      controller.onSelectedUpzila(val);
                    },
                    items: controller.upzilaList,
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
                            controller.selectedUpzila.value),
                        //controller.selectedUnion.value),
                        child: const Text('Search'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  if (!controller.isLoading.value &&
                      (controller.searchUser.value.data?.isEmpty ?? true))
                    const Center(
                      child: Column(
                        children: [
                          Text("No donor available at this moment"),
                          Text('Please search Blood group & Address base'),
                        ],
                      ),
                    ),
                  if (!controller.isLoading.value &&
                      (controller.searchUser.value.data?.isNotEmpty ?? false))
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          controller.searchUser.value.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final donor =
                            controller.searchUser.value.data?[index];
                        if (donor != null) {
                          String formattedLastDonation =
                              donor.lastDonation != null
                                  ? DateFormat('dd-MM-yyyy')
                                      .format(donor.lastDonation!)
                                  : "N/A";

                          return DonorCard(
                            name: donor.name ?? '',
                            bloodGroup: donor.bloodGroup ?? '',
                            lastDonation: formattedLastDonation,
                            totalDonations:
                                donor.totalDonation?.toString() ?? '',
                            mobile: donor.mobile?.toString() ?? '',
                            address: "${donor.address?.postOffice}, ${donor.address?.area}, ${donor.address?.district}" ,
                            isEligibleToDonate: donor.isAvailable ?? true,
                          );
                        } else {
                          return const SizedBox(); // Return empty SizedBox if donor is null
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
