import 'package:blood_donate_flutter_project/app/modules/setting/views/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              ListTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                ),
                leading: Icon(Icons.phone_rounded, color: Colors.red.shade800),
                title: const Text("+880 157 5589 936", style: TextStyle()),
                onTap: () {
                  _launchPhoneDialer("+8801575589936");
                },
              ),
              const SizedBox(
                height: 8,
              ),
              ListTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                ),
                leading: Icon(Icons.email_outlined, color: Colors.red.shade800),
                title: const Text("islanditltd@gmail.com"),
                onTap: () {
                  _launchEmailSubmission("islanditltd@gmail.com");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar get buildAppBar {
    return AppBar(
      title: const Text(
        'Give Blood Save Life ',
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
         Get.toNamed( const SettingView() as String);
        },
      ),
    );
  }

  // Function to launch the phone dialer
  _launchPhoneDialer(String phoneNumber) async {
    final url = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  // Function to launch the email dialer
  _launchEmailSubmission(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}