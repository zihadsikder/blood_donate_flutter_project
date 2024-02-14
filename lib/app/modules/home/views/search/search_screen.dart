import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'search_donor_page.dart';

class SearchScreen  extends GetView<SearchController> {
  SearchScreen({super.key});


  final currentDate = DateTime.now();

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
        // child: Padding(
        //   padding: const EdgeInsets.all(12.0),
        //   child: Form(
        //     key: controller.formKey,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         const SizedBox(height: 16.0),
        //         SizedBox(
        //           width: double.infinity,
        //           child:
        //               GetBuilder<SearchController>(builder: (donorController) {
        //             return Visibility(
        //               visible: donorController.inProgress == false,
        //               replacement:
        //                   const Center(child: CircularProgressIndicator()),
        //               child: ElevatedButton(
        //                 onPressed: () async {},
        //                 child: const Text('Search'),
        //               ),
        //             );
        //           }),
        //         ),
        //         const SizedBox(height: 16.0),
        //         // Display search results as a ListView
        //         Obx(() {
        //           final userController = Get.find<SearchController>();
        //           final user = userController.searchUser;
        //
        //           if (user == null || user.data == null || user.data!.isEmpty) {
        //             return const Text('No search results');
        //           }
        //           return ListView.builder(
        //             shrinkWrap: true,
        //             physics: const NeverScrollableScrollPhysics(),
        //             itemCount: user.data!.length,
        //             itemBuilder: (context, index) {
        //               final datum = user.data![index];
        //
        //               String formattedLastDonation = datum.lastDonation != null
        //                   ? DateFormat('dd-MM-yyyy')
        //                       .format(datum.lastDonation!.toLocal())
        //                   : '';
        //
        //               int totalDonations =
        //                   controller.donorHistoryList.data?.length ?? 0;
        //
        //               return SearchDonorPage(
        //                 name: datum.name ?? '',
        //                 bloodGroup: datum.bloodGroup ?? '',
        //                 lastDonation: formattedLastDonation,
        //                 totalDonations: totalDonations.toString(),
        //                 mobile: datum.mobile?.toString() ?? '',
        //                 address: datum.address?.postOffice ?? '',
        //                 lastDonationDate:
        //                     datum.lastDonation?.toLocal() ?? DateTime.now(),
        //                 isEligibleToDonate: datum.lastDonation != null
        //                     ? currentDate
        //                             .difference(datum.lastDonation!.toLocal())
        //                             .inDays >=
        //                         90
        //                     : false,
        //               );
        //             },
        //           );
        //         }),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
