import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/widgets/profile_summary_card.dart';
import '../../../bottom_nav/controllers/bottom_nav_controller.dart';
import '../../donation_history/views/donation_history_view.dart';
import '../../donation_history/views/widget/donation_history.dart';
import '../../update_accounts/views/update_accounts_view.dart';
import '../controllers/accounts_controller.dart';
import 'widget/activated_profile.dart';
import 'widget/logoutEleButton.dart';

class AccountsView extends GetView<AccountsController> {
 const AccountsView({super.key});

  //final profile = controller.profileData.value.data;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<BottomNavController>().backToHome();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileSummaryCard(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8),
                          ),
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
                                  backgroundImage:
                                      AssetImage('assets/blood.png'),
                                ),
                                title: Row(
                                  children: [
                                    Text(controller.profileData.value.data?.name ?? 'Name'),
                                  ],
                                ),
                                subtitle: Text(controller.isProfileActive.value
                                    ? 'Active'
                                    : 'Inactive'),
                                trailing: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (context) =>
                                              const UpdateAccountsView());
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.red.shade800,
                                    )),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                        Text(
                                          '${controller.profileData.value.data?.totalDonation ?? 0}',
                                        ),
                                        //const Text('2'),
                                        const Text('Total Donation'),
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
                                        Text(
                                          controller.profileData.value.data?.bloodGroup ??
                                              'Blood Group',
                                        ),
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
                                        Text(
                                          DateFormat('dd/MM/yyyy').format(
                                              DateTime.parse(controller.profileData.value.data
                                                      ?.lastDonation ??
                                                  DateTime.now().toString())),
                                        ),
                                        const Text('Last Donation'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        ListTile(
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: 2, color: Colors.white),
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
                          subtitle:
                              Text('+88 ${controller.profileData.value.data?.mobile.toString()}'),
                        ),
                        Container(height: 2, color: Colors.grey.shade100),
                        ListTile(
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: 2, color: Colors.white),
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
                          subtitle: Text(
                            controller.profileData.value.data?.email ?? 'N/A',
                          ),
                        ),
                        Container(height: 2, color: Colors.grey.shade100),
                        ListTile(
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: 2, color: Colors.white),
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
                          subtitle: Text(controller.profileData.value.data?.address!.postOffice ?? ''),
                        ),
                        Container(height: 1, color: Colors.grey.shade100),
                        const SizedBox(height: 5.0),
                        const DonationHistory(),
                        ActivatedProfile(
                          testValue: Text(
                            controller.isProfileActive.value
                                ? 'Deactivate Your Profile!'
                                : 'Activate Your Profile!',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          value: controller.isProfileActive.value,
                          onChanged: (isActive) async {
                            controller.isProfileActive.value = isActive;
                            await controller.toggleProfileActivation(isActive);
                          },
                        ),
                        const SizedBox(height: 16),
                        LogoutEleButton(
                          onPress: () => controller.logout(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red.shade700,
          onPressed: () {
            Get.to(() => const DonationHistoryView());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
