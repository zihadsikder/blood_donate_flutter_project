import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/widgets/profile_summary_card.dart';
import '../../../data/models/request/service_data_req.dart';
import '../../bottom_nav/controllers/bottom_nav_controller.dart';
import '../controllers/govt_services_controller.dart';

class GovtServicesView extends GetView<GovtServicesController> {
  GovtServicesView({super.key});

  final List<ServiceData> websites = [
    ServiceData(
      name: 'Bus Tickets',
      link: 'https://www.shohoz.com/bus-tickets',
      profilePicAsset: "assets/bus.png",
    ),
    ServiceData(
      name: 'Train Tickets',
      link: 'https://eticket.railway.gov.bd/',
      profilePicAsset: "assets/train.png",
    ),
    ServiceData(
      name: 'Air Tickets',
      link: 'https://www.biman-airlines.com/',
      profilePicAsset: "assets/biman.png",
    ),
    ServiceData(
      name: 'Result',
      link: 'http://www.educationboardresults.gov.bd/',
      profilePicAsset: "assets/result.png",
    ),
    ServiceData(
      name: 'Search Jobs',
      link: 'https://www.bdjobs.com/',
      profilePicAsset: "assets/bdjobs.png",
    ),
    ServiceData(
      name: 'XI Admission',
      link: 'https://xiclassadmission.com.bd/',
      profilePicAsset: "assets/admission.png",
    ),
  ];

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.red.shade800,
    //     statusBarIconBrightness: Brightness.light));
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
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: websites.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _launchUrl(websites[index].link);
                      },
                      child: Card(
                        elevation: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              websites[index].profilePicAsset,
                              width: 100,
                              height: 100,
                            ),
                            Text(websites[index].name),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
