import 'package:blood_bd/app/core/constants/app_assets.dart';
import 'package:blood_bd/app/modules/account/accounts/views/widget/accounts_info.dart';
import 'package:blood_bd/app/modules/account/accounts/views/widget/donation_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/config/app_colors.dart';
import '../../../../core/widgets/profile_summary_card.dart';
import '../../../bottom_nav/controllers/bottom_nav_controller.dart';
import '../../donation_history/views/widget/donation_history.dart';
import '../../update_accounts/views/update_accounts_view.dart';
import '../controllers/accounts_controller.dart';
import 'widget/activated_profile.dart';
import 'widget/logoutEleButton.dart';

class AccountsView extends GetView<AccountsController> {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<BottomNavController>().backToHome();
      },
      child: Scaffold(
        body: Obx(
          () => SafeArea(
            child: RefreshIndicator(
              onRefresh: () => controller.getProfileData(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    ProfileSummaryCard(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: controller.profileData.value.data == null
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Column(
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
                                              width: 0,
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        leading: const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          backgroundImage: AssetImage(
                                              AppAssets.profileAccount),
                                        ),
                                        title: Row(
                                          children: [
                                            Text(controller.profileData.value
                                                    .data?.name ??
                                                'Name'),
                                          ],
                                        ),
                                        subtitle: Text(
                                            controller.isProfileActive.value
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
                                              color: AppColors.bgColor,
                                            )),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          DonationInfo(
                                            value:
                                                '${controller.profileData.value.data?.totalDonation ?? 0}',
                                            text: 'Total Donation',
                                          ),
                                          DonationInfo(
                                            value: controller.profileData.value
                                                    .data?.bloodGroup ??
                                                '',
                                            text: 'Blood Group',
                                          ),
                                          DonationInfo(
                                            value: controller.profileData.value
                                                        .data?.lastDonation !=
                                                    null
                                                ? DateFormat('dd/MM/yyyy')
                                                    .format(DateTime.parse(
                                                        controller
                                                            .profileData
                                                            .value
                                                            .data
                                                            ?.lastDonation))
                                                : 'N/A',
                                            text: 'Last Donation',
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                AccountsInfo(
                                  icon: Icons.call,
                                  text: 'Mobile',
                                  value:
                                      '+88 ${controller.profileData.value.data?.mobile.toString()}',
                                ),
                                Container(
                                    height: 2, color: Colors.grey.shade100),
                                AccountsInfo(
                                  icon: Icons.email_outlined,
                                  text: 'Email',
                                  value: controller
                                          .profileData.value.data?.email ??
                                      'N/A',
                                ),
                                Container(
                                    height: 2, color: Colors.grey.shade100),
                                AccountsInfo(
                                  icon: Icons.maps_home_work_outlined,
                                  text: 'Address',
                                  value:
                                      "${controller.profileData.value.data?.address!.postOffice}, ${controller.profileData.value.data?.address!.area}, ${controller.profileData.value.data?.address!.district}.",
                                ),
                                Container(
                                    height: 1, color: Colors.grey.shade100),
                                const SizedBox(height: 5.0),
                                const DonationHistory(),
                                ActivatedProfile(
                                  testValue: Text(
                                    controller.isProfileActive.value
                                        ? 'Deactivate Your Profile!'
                                        : 'Activate Your Profile!',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  value: controller.isProfileActive.value,
                                  onChanged: (isActive) async {
                                    controller.isProfileActive.value = isActive;
                                    await controller
                                        .toggleProfileActivation(isActive);
                                  },
                                ),
                                const SizedBox(height: 16),
                                LogoutEleButton(
                                  onPress: () => controller.logout(),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
