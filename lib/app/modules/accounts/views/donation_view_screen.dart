import 'package:blood_donate_flutter_project/app/modules/accounts/controllers/accounts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/widgets/dob_text_field.dart';
import 'widget/alert_cancel_button.dart';

class DonationViewScreen extends StatefulWidget {
  const DonationViewScreen({super.key});

  @override
  State<DonationViewScreen> createState() => _DonationViewScreenState();
}

class _DonationViewScreenState extends State<DonationViewScreen> {
  final AccountsController controller = Get.put(AccountsController());

  @override
  void initState() {
    super.initState();
    controller.getDonationList();
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
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.placeTEController,
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
                    child: Obx(
                      () => Visibility(
                        visible: controller.inProgress.value == false,
                        replacement:
                            const Center(child: CircularProgressIndicator()),
                        child: ElevatedButton(
                          onPressed: () async {
                            // Await the addDonation method call
                            await controller.addDonation();
                          },
                          child: const Text(
                            'ADD DONATION',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
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
          Expanded(
            flex: 70,
            child: Obx(
              () {
                if (controller.inProgress.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.donorHistoryList?.data != null) {
                  return ListView.builder(
                    itemCount: controller.donorHistoryList?.data!.length,
                    itemBuilder: (context, index) {
                      final donation =
                          controller.donorHistoryList?.data![index];

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
                          title: Text(donation?.donationPlace ?? '',
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis)),
                          subtitle: Text(
                              'Date: ${DateFormat('yyyy.MM.dd').format(donation?.donationDate ?? DateTime.now())}'),
                          trailing: const Icon(
                            Icons.delete_outline_sharp,
                          ),
                          onTap: () {
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
                                          backgroundColor: Colors.red.shade800),
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
                      );
                    },
                  );
                } else {
                  return const Center(
                      child: Text("No donation history available"));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
