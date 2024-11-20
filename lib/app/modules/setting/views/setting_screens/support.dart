import 'package:flutter/material.dart';
import 'package:blood_bd/app/modules/setting/views/widget/list_title_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/widgets/app_bar_widgets.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidgets(title: 'Support'),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ListTitleWidgets
                (icon: Icons.phone_rounded,
                  text: '+880 157 5589 936',
                  onTap: () {
                    _launchPhoneDialer("+8801575589936");
                  }, ),
              const SizedBox(height: 8),
              ListTitleWidgets
                (icon: Icons.email_outlined,
                text: 'blooddonorbd.island@gmail.com',
                onTap: () {
                  _launchEmailSubmission('blooddonorbd.island@gmail.com');
                },),

            ],
          ),
        ),
      ),
    );
  }

  _launchPhoneDialer(String phoneNumber) async {
    final url = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchEmailSubmission(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    try {
      await launch(emailLaunchUri.toString());
    } catch (e) {
      throw 'Could not launch $email';
    }
  }
}
