import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/dob_text_field.dart';
import '../../accounts/views/widget/alert_cancel_button.dart';
import '../controllers/donation_history_controller.dart';

class DonationHistoryView extends GetView<DonationHistoryController> {
  const DonationHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation History'),
        leading: const BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.placeTEController,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'Donation Place',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          suffixIcon: Icon(Icons.location_on)),
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter Donation Place';
                        }
                        return null;
                      },
                    ),
                    Container(height: 2, color: Colors.grey.shade100),
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
                            // Convert pickedDate to a formatted string before assigning it
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            controller.dateTEController.text = formattedDate;
                          }
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          await controller.addDonation(
                            donationPlace: controller.placeTEController.text,
                            donationDate: controller.dateTEController.text,
                          );
                        },
                        child: const Text(
                          'ADD DONATION',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Obx(
              () {
                if (controller.inProgress.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.donorHistoryList?.data != null) {
                  return Column(
                    children:
                        controller.donorHistoryList!.data!.map((donation) {
                      final index =
                          controller.donorHistoryList!.data!.indexOf(donation);
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey.shade100),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: Colors.white,
                          leading: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Text('${index + 1}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ),
                          title: Text(donation.donationPlace ?? '',
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis)),
                          subtitle: Text(
                              'Date: ${DateFormat('yyyy.MM.dd').format(donation.donationDate ?? DateTime.now())}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline_sharp),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Alert!'),
                                    content: const Text(
                                        'Are You Sure! Want to delete your donation history?'),
                                    actions: [
                                      const AlertCancelButton(),
                                      TextButton(
                                        onPressed: () =>
                                            controller.deleteDonation(
                                                id: controller.donorHistoryList!
                                                    .data![index].id!),
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                Colors.red.shade800),
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  return const Center(
                      child: Text("No donation history available"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
