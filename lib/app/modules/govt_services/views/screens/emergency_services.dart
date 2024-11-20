import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/widgets/app_bar_widgets.dart';
import '../../../setting/views/widget/list_title_widgets.dart';

class EmergencyServices extends StatelessWidget {
  const EmergencyServices({super.key});

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
              ListTitleWidgets(
                icon: Icons.crisis_alert_outlined,
                trailingIcon: Icons.phone_outlined,
                text: 'জরুরী সেবা- 999',
                onTap: () {
                  _launchPhoneDialer("999");
                },
              ),
              const SizedBox(height: 8),
              ListTitleWidgets(
                icon: Icons.crisis_alert_outlined,
                trailingIcon: Icons.phone_outlined,
                text: 'শিশু সহায়তা- 1098',
                onTap: () {
                  _launchPhoneDialer("1098");
                },
              ),
              const SizedBox(height: 8),
              ListTitleWidgets(
                icon: Icons.crisis_alert_outlined,
                trailingIcon: Icons.phone_outlined,
                text: 'সরকারি তথ্য সেবা- 333',
                onTap: () {
                  _launchPhoneDialer("333");
                },
              ),
              const SizedBox(height: 8),
              ListTitleWidgets(
                icon: Icons.crisis_alert_outlined,
                trailingIcon: Icons.phone_outlined,
                text: 'ফায়ার সার্ভিস- 16163',
                onTap: () {
                  _launchPhoneDialer("16163");
                },
              ),
              const SizedBox(height: 8),
              ListTitleWidgets(
                icon: Icons.crisis_alert_outlined,
                trailingIcon: Icons.phone_outlined,
                text: 'নারী ও শিশু নির্যাতন- 109',
                onTap: () {
                  _launchPhoneDialer("109");
                },
              ),
              const SizedBox(height: 8),
              ListTitleWidgets(
                icon: Icons.crisis_alert_outlined,
                trailingIcon: Icons.phone_outlined,
                text: 'দুদক- 106',
                onTap: () {
                  _launchPhoneDialer("106");
                },
              ),
              const SizedBox(height: 8),
              ListTitleWidgets(
                icon: Icons.crisis_alert_outlined,
                trailingIcon: Icons.phone_outlined,
                text: 'দূর্যোগ ও ঘূর্ণিঝড়- 1090',
                onTap: () {
                  _launchPhoneDialer("1090");
                },
              ),
              const SizedBox(height: 8),
              ListTitleWidgets(
                icon: Icons.crisis_alert_outlined,
                trailingIcon: Icons.phone_outlined,
                text: 'নাগরিক ভূমিসেবা কেন্দ্র- 16122',
                onTap: () {
                  _launchPhoneDialer("16122");
                },
              ),
              const SizedBox(height: 8),
              ListTitleWidgets(
                icon: Icons.crisis_alert_outlined,
                trailingIcon: Icons.phone_outlined,
                text: 'শিশুদের সুরক্ষা- 1098',
                onTap: () {
                  _launchPhoneDialer("1098");
                },
              ),
              const SizedBox(height: 8),
              ListTitleWidgets(
                icon: Icons.crisis_alert_outlined,
                trailingIcon: Icons.phone_outlined,
                text: 'মাদকদ্রব্য নিয়ন্ত্রণ অধিদপ্তর- ',
                onTap: () {
                  _launchPhoneDialer("+8801908888888");
                },
              ),
              const SizedBox(height: 8),
              ListTitleWidgets(
                icon: Icons.crisis_alert_outlined,
                trailingIcon: Icons.phone_outlined,
                text: 'পাসপোর্ট সংক্রান্ত- 16445',
                onTap: () {
                  _launchPhoneDialer("16445");
                },
              ),
              const SizedBox(height: 8),
              ListTitleWidgets(
                icon: Icons.crisis_alert_outlined,
                trailingIcon: Icons.phone_outlined,
                text: 'অসহায়,দরিদ্র,নির্যাতিত শ্রেণী- 16430',
                onTap: () {
                  _launchPhoneDialer("16430");
                },
              ),
              const SizedBox(height: 8),
              ListTitleWidgets(
                icon: Icons.crisis_alert_outlined,
                trailingIcon: Icons.phone_outlined,
                text: 'কৃষি- 16123',
                onTap: () {
                  _launchPhoneDialer("16123");
                },
              ),
              const SizedBox(height: 8),
              ListTitleWidgets(
                icon: Icons.crisis_alert_outlined,
                trailingIcon: Icons.phone_outlined,
                text: 'অ্যাম্বুলেন্স- 16263',
                onTap: () {
                  _launchPhoneDialer("16263");
                },
              ),
              const SizedBox(height: 8),
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

}
