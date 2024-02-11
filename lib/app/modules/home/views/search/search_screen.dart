// import 'package:blood_donate_flutter_project/app/modules/home/views/search/search_donor_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// import '../../../auth/views/widgets/location_form.dart';
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
// class _SearchScreenState extends State<SearchScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     // Define currentDate here
//     final currentDate = DateTime.now();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Find A Blood Donor"),
//         centerTitle: true,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Form(
//             //key: formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 bloodAndAddressForm,
//                 const SizedBox(height: 16.0),
//                 SizedBox(
//                   width: double.infinity,
//                   child: Visibility(
//                     //visible: controller.inProgress == false,
//                     replacement: const Center(child: CircularProgressIndicator()),
//                     child: ElevatedButton(
//                       onPressed: () async {
//     if (_formKey.currentState!.validate()) {
//     //   final bool result = await donorController.searchDonor(
//     //     selectedBloodGroup,
//     //     selectedDivision,
//     //     selectedDistrict,
//     //     selectedUpzila,
//     //     selectedUnion,
//     //   );
//     //   if (result) {
//     //   } else {
//     //     Get.showSnackbar(const GetSnackBar(
//     //       title: 'Search Donor Fail',
//     //       duration: Duration(seconds: 2),
//     //       isDismissible: true,
//     //       message: 'Try Again',
//     //     ));
//     //   }
//     // }                //
//                       },
//                       child: const Text('Search'),
//                     ),
//                   );
//                 ),
//                 const SizedBox(height: 16.0),
//                 // Display search results as a ListView
//                 GetBuilder<controller>(builder: (context) {
//                   if (userController.user == null || userController.user!.data == null) {
//                     return const Text('No search results');
//                   }
//                   return ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: userController.user!.data!.length,
//                     itemBuilder: (context, index) {
//                       String formattedLastDonation = DateFormat('dd-MM-yyyy').format(
//                         userController.user!.data![index].lastDonation!.toLocal(),
//                       );
//                       int totalDonations = getDonationHistoryController.donorHistoryList.data?.length ?? 0;
//                       return SearchDonorPage(
//                         name: userController.user!.data![index].name ?? '',
//                         bloodGroup: userController.user!.data![index].bloodGroup ?? '',
//                         lastDonation: formattedLastDonation,
//                         totalDonations: totalDonations.toString(),
//                         mobile: userController.user!.data![index].mobile?.toString() ?? '',
//                         address: userController.user!.data![index].address?.postOffice ?? '',
//
//                         lastDonationDate: userController.user!.data![index].lastDonation!.toLocal(),
//                         isEligibleToDonate: currentDate.difference(userController.user!.data![index].lastDonation!.toLocal()).inDays >= 90,
//                       );
//                     },
//                   );
//                 }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   LocationFormScreen get bloodAndAddressForm {
//     return LocationFormScreen(
//       selectedBloodGroup: selectedBloodGroup,
//       selectedDivisionName: '',
//       selectedDistrictName: '',
//       selectedUpzilaName: '',
//       selectedUnionName: '',
//       onBloodGroupSelected: (bloodGroup) {
//         setState(() {
//           selectedBloodGroup = bloodGroup;
//         });
//       },
//     );
//   }
// }