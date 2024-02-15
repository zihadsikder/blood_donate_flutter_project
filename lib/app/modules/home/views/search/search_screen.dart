import 'package:blood_donate_flutter_project/app/modules/home/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../auth/login/views/widgets/area_dropdown.dart';
import '../../../auth/login/views/widgets/location_form.dart';

import 'search_donor_page.dart';

import '../../../auth/signup/controllers/signup_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SignupController signupController = Get.put(SignupController());
  final SearchDonationController searchController =
      Get.put(SearchDonationController());

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
                    signupController.onSelectedBloodGroup(val);
                  },
                ),
                const SizedBox(height: 8.0),
                AreaDropDown(
                  label: 'select division',
                  onChanged: (String? val) {
                    signupController.onSelectedDivision(val);
                  },
                  items: signupController.divisionList,
                ),
                AreaDropDown(
                  label: 'select district',
                  onChanged: (String? val) {
                    signupController.onSelectedDistrict(val);
                  },
                  items: signupController.districtList,
                ),
                AreaDropDown(
                  label: 'select upzila',
                  onChanged: (String? val) {
                    signupController.onSelectedUpzila(val);
                  },
                  items: signupController.upzilaList,
                ),
                AreaDropDown(
                  label: 'select union',
                  onChanged: (String? val) {
                    signupController.onSelectedUnion(val);
                  },
                  items: signupController.unionList,
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: Visibility(
                    visible: !searchController.inProgress.value,
                    replacement:
                        const Center(child: CircularProgressIndicator()),
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: searchController.searchUser?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    // Access the donor from the donorHistoryList
                    final donor = searchController.searchUser?.data?[index];

                    if (donor != null) {
                      String formattedLastDonation =
                          DateFormat('dd-MM-yyyy').format(
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
                      // Return a placeholder widget or handle the null case
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
