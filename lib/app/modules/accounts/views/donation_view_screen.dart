import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'widget/aleart_cancel_button.dart';

class DonationViewScreen extends StatefulWidget {
  const DonationViewScreen({super.key});

  @override
  State<DonationViewScreen> createState() => _DonationViewScreenState();
}

class _DonationViewScreenState extends State<DonationViewScreen> {
  // final GetDonationHistoryController _getDonationHistoryController =
  // Get.put(GetDonationHistoryController());
  // final TextEditingController _paceTEController = TextEditingController();
  // final TextEditingController _dateTEController = TextEditingController();
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //
  // // final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  //     GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    //_getDonationHistoryController.getDonationList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Form(
             // key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    //controller: _paceTEController,
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Donation Place',
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        suffixIcon: Icon(Icons.location_on)),
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter Donation Place';
                      }
                      return null;
                    },
                  ),
                  Container(height: 2, color: Colors.grey.shade100),
                  //dateOfDonationField(context),
                  const SizedBox(
                    height: 8,
                  ),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: GetBuilder<DonationHistoryController>(
                  //       builder: (donationHistoryController) {
                  //         return Visibility(
                  //           visible: donationHistoryController.inProgress == false,
                  //           replacement:
                  //           const Center(child: CircularProgressIndicator()),
                  //           child: ElevatedButton(
                  //             onPressed: () async {
                  //               if (_formKey.currentState!.validate()) {
                  //                 final bool result =
                  //                 await donationHistoryController.addDonation(
                  //                   _paceTEController.text.trim(),
                  //                   _dateTEController.text.trim(),
                  //                 );
                  //                 if (result) {
                  //                   if (mounted) {
                  //                     showSnackMessage(
                  //                         context, 'New History added!');
                  //                   }
                  //                 } else {
                  //                   Get.showSnackbar(GetSnackBar(
                  //                     title: 'Add Donation Fail',
                  //                     message:
                  //                     donationHistoryController.errorMessage,
                  //                     duration: const Duration(seconds: 2),
                  //                     isDismissible: true,
                  //                   ));
                  //                 }
                  //               }
                  //             },
                  //             child: const Text(
                  //               'ADD DONATION',
                  //               style: TextStyle(
                  //                   fontSize: 16, fontWeight: FontWeight.bold),
                  //             ),
                  //           ),
                  //         );
                  //       }),
                  // ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          //getDonorList
          // RefreshIndicator(
          //     key: _refreshIndicatorKey,
          //     onRefresh: () async {
          //       await _getDonationHistoryController.getDonationList();
          //     },
          //     child: getDonorList),
        ],
      ),
    );
  }

  // TextFormField dateOfDonationField(BuildContext context) {
  //   return TextFormField(
  //     controller: _dateTEController,
  //     decoration: InputDecoration(
  //       hintText: 'Date of Donation',
  //       border:
  //       const OutlineInputBorder(borderSide: BorderSide.none),
  //       suffixIcon: IconButton(
  //         onPressed: () async {
  //           DateTime? pickedDate = await showDatePicker(
  //             context: context,
  //             initialDate: DateTime.now(),
  //             firstDate: DateTime(1950),
  //             lastDate: DateTime(2050),
  //           );
  //           if (pickedDate != null &&
  //               pickedDate != _dateTEController.text) {
  //             setState(() {
  //               _dateTEController.text =
  //               "${pickedDate.toLocal()}".split(' ')[0];
  //             });
  //           }
  //         },
  //         icon: const Icon(Icons.calendar_today,
  //             color: Colors.grey),
  //       ),
  //     ),
  //     validator: (value) {
  //       if (value?.trim().isEmpty ?? true) {
  //         return 'Enter Donation Date';
  //       }
  //       return null;
  //     },
  //   );
  // }
  //
  // Expanded get getDonorList {
  //   return Expanded(
  //     flex: 70,
  //     child: GetBuilder<GetDonationHistoryController>(
  //       builder: (getDonationHistoryController) {
  //         if (getDonationHistoryController.inProgress) {
  //           return const Center(child: CircularProgressIndicator());
  //         } else if (getDonationHistoryController.donorHistoryList.data !=
  //             null) {
  //           return ListView.builder(
  //             itemCount:
  //             getDonationHistoryController.donorHistoryList.data!.length,
  //             itemBuilder: (context, index) {
  //               final donation =
  //               getDonationHistoryController.donorHistoryList.data![index];
  //
  //               return Padding(
  //                 padding: const EdgeInsets.all(5.0),
  //                 child: ListTile(
  //                   shape: RoundedRectangleBorder(
  //                     side: BorderSide(color: Colors.grey.shade100),
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                   tileColor: Colors.white,
  //                   leading: CircleAvatar(
  //                     backgroundColor: Colors.red,
  //                     child: Text('${index + 1}',
  //                         style: const TextStyle(fontWeight: FontWeight.bold)),
  //                   ),
  //                   title: Text(donation.donationPlace ?? '',
  //                       style:
  //                       const TextStyle(overflow: TextOverflow.ellipsis)),
  //                   subtitle: Text(
  //                       'Date: ${DateFormat('yyyy.MM.dd').format(donation.donationDate ?? DateTime.now())}'),
  //                   trailing: const Icon(
  //                     Icons.delete_outline_sharp,
  //                   ),
  //                   onTap: () {
  //                     showDialog(
  //                       context: context,
  //                       builder: (BuildContext context) {
  //                         return AlertDialog(
  //                           title: const Text('Alert!'),
  //                           content: const Text(
  //                               'Are You Sure! Want to delete your donation history?'),
  //                           actions: [
  //                             const AlertCancelButton(),
  //                             TextButton(
  //                               onPressed: () {
  //                                 // Handle delete operation
  //                               },
  //                               child: const Text(
  //                                 'Okk',
  //                                 style: TextStyle(color: Colors.red),
  //                               ),
  //                             ),
  //                           ],
  //                         );
  //                       },
  //                     );
  //                   },
  //                 ),
  //               );
  //             },
  //           );
  //         } else {
  //           return const Center(child: Text("No donation history available"));
  //         }
  //       },
  //     ),
  //   );
  // }


}