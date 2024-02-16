
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../auth/login/views/widgets/area_dropdown.dart';
import '../../../auth/login/views/widgets/location_form.dart';
import '../../../auth/signup/controllers/signup_controller.dart';
import '../../controllers/search_controller.dart';
import 'search_donor_page.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SignupController signupController = Get.put(SignupController());

  final SearchDonationController searchController = Get.put(SearchDonationController());
  @override

  @override
  Widget build(BuildContext context) {
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
            key: searchController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BloodGroupDropdown(
                  onSelectBloodGroup: (String? val) {
                    // Update selected blood group
                    signupController.selectedBloodGroup.value = val ?? '';
                  },
                ),
                const SizedBox(height: 8.0),
                AreaDropDown(
                  label: 'select division',
                  onChanged: (String? val) {
                    // Update selected division
                    signupController.selectedDivision.value = val ?? '';
                  },
                  items: signupController.divisionList,
                ),
                AreaDropDown(
                  label: 'select district',
                  onChanged: (String? val) {
                    // Update selected district
                    signupController.selectedDistrict.value;
                  },
                  items: signupController.districtList,
                ),
                AreaDropDown(
                  label: 'select upzila',
                  onChanged: (String? val) {
                    // Update selected upzila
                    signupController.selectedUpzila.value;
                  },
                  items: signupController.upzilaList,
                ),
                AreaDropDown(
                  label: 'select union',
                  onChanged: (String? val) {
                    // Update selected union
                    signupController.selectedUnion.value;
                  },
                  items: signupController.unionList,
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: Visibility(
                    visible: searchController.inProgress.value == false,
                    replacement: const Center(child: CircularProgressIndicator()),
                    child: ElevatedButton(
                      onPressed: () => searchController.searchDonor(
                        signupController.selectedBloodGroup.value,
                        signupController.selectedDivision.value,
                        signupController.selectedDistrict.value,
                        signupController.selectedUpzila.value,
                        signupController.selectedUnion.value,
                      ),
                      child: const Text('Search'),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                // Only wrap the ListView.builder with Obx
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: searchController.searchUser?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final donor = searchController.searchUser?.data?[index];
                      if (donor != null) {
                        String formattedLastDonation = DateFormat('dd-MM-yyyy').format(
                          donor.lastDonation!.toLocal(),
                        );
                        return SearchDonorPage(
                          name: donor.name ?? '',
                          bloodGroup: donor.bloodGroup ?? '',
                          lastDonation: formattedLastDonation,
                          totalDonations: donor.totalDonation?.toString() ?? '',
                          mobile: donor.mobile?.toString() ?? '',
                          address: donor.address?.postOffice ?? '',
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
