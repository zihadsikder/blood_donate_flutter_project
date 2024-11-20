import 'package:blood_bd/app/core/widgets/card_widgets.dart';
import 'package:blood_bd/app/modules/govt_services/views/screens/calculate_bmi.dart';
import 'package:blood_bd/app/modules/govt_services/views/screens/emergency_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/profile_summary_card.dart';
import '../../bottom_nav/controllers/bottom_nav_controller.dart';
import '../controllers/govt_services_controller.dart';

class GovtServicesView extends GetView<GovtServicesController> {
  const GovtServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<BottomNavController>().backToHome();
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              ProfileSummaryCard(),
              // Adding padding around the rest of the widgets
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0, vertical: 8.0), // Adjust padding as needed
                child: Column(
                  children: [
                    CardWidgets(
                      tittle: 'Emergency Hotline Service',
                      onTap: () {
                        Get.to(const EmergencyServices());
                      },
                    ),
                    CardWidgets(
                      tittle: 'Calculate Your BMI',
                      onTap: () {
                        Get.to(const CalculateBmi());
                      },
                    ),
                  ],
                ),
              ),

              // Padding for GridView
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: controller.websites.length,
                      itemBuilder: (context, index) {
                        final service = controller.websites[index];
                        return GestureDetector(
                          onTap: () => controller.handleServiceTap(service),
                          child: Card(
                            elevation: 1,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Image.asset(
                                      service.profilePicAsset,
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    service.name,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
