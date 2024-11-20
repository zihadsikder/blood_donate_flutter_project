import 'package:get/get.dart';

import '../../../data/models/request/service_data_req.dart';
import '../views/webview_page.dart';

class GovtServicesController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  final List<ServiceData> websites = [
    ServiceData(
      name: 'Bus Tickets',
      link: 'https://www.shohoz.com/bus-tickets',
      profilePicAsset: "assets/bus.png",
      isUrl: true,
    ),
    ServiceData(
      name: 'Train Tickets',
      link: 'https://eticket.railway.gov.bd/',
      profilePicAsset: "assets/train.png",
      isUrl: true,
    ),
    ServiceData(
      name: 'Air Tickets',
      link: 'https://www.biman-airlines.com/',
      profilePicAsset: "assets/biman.png",
      isUrl: true,
    ),
    ServiceData(
      name: 'Result',
      link: 'http://www.educationboardresults.gov.bd/',
      profilePicAsset: "assets/result.png",
      isUrl: true,
    ),
    ServiceData(
      name: 'Search Jobs',
      link: 'https://www.bdjobs.com/',
      profilePicAsset: "assets/bdjobs.png",
      isUrl: true,
    ),
    ServiceData(
      name: 'XI Admission',
      link: 'https://xiclassadmission.com.bd/',
      profilePicAsset: "assets/admission.png",
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
    } else {
      // Navigate to another page
      Get.toNamed(service.link); // Ensure proper routing
    }
  }


}
