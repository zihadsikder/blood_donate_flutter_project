import 'package:blood_bd/app/modules/govt_services/views/screens/ambulance_services.dart';
import 'package:blood_bd/app/modules/govt_services/views/screens/hospital_service.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../../../data/models/request/service_data_req.dart';
import '../views/screens/webview_page.dart';

class GovtServicesController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  final List<ServiceData> websites = [
    ServiceData(
      name: 'Hospital',
      link: ()=> Get.to(const HospitalService()),
      profilePicAsset: AppAssets.hospital,
      isUrl: true,
    ),
    ServiceData(
      name: 'Ambulance',
      link: ()=> Get.to(const AmbulanceServices()),
      profilePicAsset: AppAssets.ambulance,
      isUrl: false,
    ),
    ServiceData(
      name: 'E-Passport',
      link: 'https://www.epassport.gov.bd/landing',
      profilePicAsset: AppAssets.passport,
      isUrl: true,
    ),
    ServiceData(
      name: 'Bus Tickets',
      link: 'https://www.shohoz.com/bus-tickets',
      profilePicAsset: AppAssets.bus,
      isUrl: true,
    ),
    ServiceData(
      name: 'Train Tickets',
      link: 'https://eticket.railway.gov.bd/',
      profilePicAsset: AppAssets.train,
      isUrl: true,
    ),
    ServiceData(
      name: 'Air Tickets',
      link: 'https://www.biman-airlines.com/',
      profilePicAsset: AppAssets.air,
      isUrl: true,
    ),
    ServiceData(
      name: 'Result',
      link: 'https://eboardresults.com/bn/ebr.app/home/',
      profilePicAsset: AppAssets.result,
      isUrl: true,
    ),
    ServiceData(
      name: 'Search Jobs',
      link: 'https://www.bdjobs.com/',
      profilePicAsset: AppAssets.jobs,
      isUrl: true,
    ),
    ServiceData(
      name: 'XI Admission',
      link: 'https://xiclassadmission.com.bd/',
      profilePicAsset: AppAssets.admission,
      isUrl: true,
    ),
  ];

 // Future<void> handleServiceTap(ServiceData service) async {
 //   if (service.isUrl) {
 //     final Uri uri = Uri.parse(service.link);
 //     if (await canLaunchUrl(uri)) {
 //       await launchUrl(uri);
 //     } else {
 //       Get.snackbar("Error", "Could not launch ${service.link}");
 //     }
 //   } else {
 //     Get.to(service.link);
 //   }
 // }
  void handleServiceTap(ServiceData service) {
    if (service.isUrl) {
      Get.to(() => WebViewPage(url: service.link, title: service.name));
    } else if (service.link is Function) {
      service.link(); // Invoke the navigation function
    } else {
      Get.snackbar("Error", "Invalid service link.");
    }
  }



}
