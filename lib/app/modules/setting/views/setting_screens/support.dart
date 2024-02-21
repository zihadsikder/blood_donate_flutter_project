import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
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

  AppBar buildAppBar() {
    return AppBar(
      leading: const BackButton(color: Colors.white),
      title: const Text('Support'),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.red.shade800,
          statusBarIconBrightness: Brightness.light),
    );
  }

  _launchPhoneDialer(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }


  _launchEmailSubmission(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
    );
    String url = params.toString();
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
