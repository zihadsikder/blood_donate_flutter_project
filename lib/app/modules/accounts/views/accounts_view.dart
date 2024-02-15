import 'package:blood_donate_flutter_project/app/modules/accounts/views/account_update_dailoge.dart';
import 'package:blood_donate_flutter_project/app/modules/accounts/views/donation_view_screen.dart';
import 'package:blood_donate_flutter_project/app/services/auth_cache.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/widgets/profile_summary_card.dart';
import '../controllers/accounts_controller.dart';
import 'widget/aleart_cancel_button.dart';

class AccountsView extends GetView<AccountsController> {
  AccountsView({super.key});

  final userModel = AuthCache.to.getUser()?.data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummaryCard(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            ListTile(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 0, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              leading: const CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage('assets/blood.png'),
                              ),
                              title: Row(
                                children: [
                                  Text('zihad'),
                                  //Text(userModel?.name ?? 'Name'),
                                ],
                              ),
                              subtitle: const Text('Blood : Available'),
                              trailing: GestureDetector(
                                  onTap: () {
                                    //Get.to(EditProfileScreen());
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) =>
                                            const AccountUpdateDialoge());
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.red.shade800,
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.bloodtype_outlined,
                                        color: Colors.red.shade900,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      // Text(
                                      //     '${controller.donorHistoryList.data?.length ?? 0}'),
                                      GestureDetector(
                                          onTap: () {
                                            Get.to(() =>
                                                const DonationViewScreen());
                                          },
                                          child: const Text('Total Donate')),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.bloodtype_outlined,
                                        color: Colors.red.shade900,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text('zihad'),
                                      // Text(
                                      //   userModel?.bloodGroup ?? 'Blood Group',
                                      // ),
                                      const Text('Blood Group'),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.bloodtype_outlined,
                                        color: Colors.red.shade900,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      // Text(DateFormat.yMd().format(
                                      //     controller.authCache.getUser()?.data!
                                      //         .lastDonation ??
                                      //         DateTime.now())),
                                      const Text('Last Donation'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      leading: Icon(
                        Icons.call,
                        color: Colors.red.shade700,
                        size: 30,
                      ),
                      title: const Row(
                        children: [
                          Text('Mobile'),
                        ],
                      ),
                      subtitle: Text('zihad'),
                      //Text(userModel!.mobile.toString() ?? ''),
                    ),
                    Container(height: 1, color: Colors.grey.shade100),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      leading: Icon(
                        Icons.email_outlined,
                        color: Colors.red.shade700,
                        size: 30,
                      ),
                      title: const Row(
                        children: [
                          Text('Email'),
                        ],
                      ),
                      subtitle: Text('zihad'),
                      // Text(
                      //   userModel!.email ?? '',
                      // ),
                    ),
                    Container(height: 1, color: Colors.grey.shade100),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      leading: SizedBox(
                        width: 32,
                        //color: Colors.grey,
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/map.png',
                            height: 36,
                            width: 24,
                          ),
                        ),
                      ),
                      title: const Row(
                        children: [
                          Text('Address'),
                        ],
                      ),
                      subtitle: Text('zihad'),
                      //Text(userModel!.address!.postOffice ?? ''),
                    ),
                    Container(height: 1, color: Colors.grey.shade100),
                    const SizedBox(
                      height: 16,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Donate your blood',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )),
                            const Spacer(),
                            Switch(
                                value: true,
                                onChanged: (isTrue) {
                                  // setState(() {
                                  //   donateBlood = isTrue;
                                  // });
                                })
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    buildLogoutElevatedButton(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Get.to(()=>const Donation());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  ElevatedButton buildLogoutElevatedButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Row(
                    children: [
                      const Text("Ready to Leave?",
                          style: TextStyle(fontSize: 16)),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.highlight_remove_outlined))
                    ],
                  ),
                  content: const Text(
                      'Select "Logout" below if you are ready to end your current session.'),
                  actions: [
                    const AlertCancelButton(),
                    Visibility(
                      visible: controller.inProgress.value = false,
                      replacement:
                          const Center(child: CircularProgressIndicator()),
                      child: TextButton(
                        onPressed: ()=> controller.logout(),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.red.shade800),
                        child: const Text('Logout',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                );
              });
        },
        child: const Text('Logout'));
  }
}
