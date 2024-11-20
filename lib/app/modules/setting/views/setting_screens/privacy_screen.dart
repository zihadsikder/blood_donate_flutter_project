import 'package:flutter/material.dart';

import '../../../../core/widgets/app_bar_widgets.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidgets(title: 'Privacy Policy'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What information do we collect?',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'We collect information from you use the donor mobile app, update your personal profile, place an order donate blood, or submit a Web form. When logging in, ordering, or performing other transactions on the websites, you may be asked to enter your name, job title, birth date, age, email address, mailing address or phone number.',
              ),
              SizedBox(height: 12.0),
              Text(
                '1. Your privacy is important to us. Personal information collected through this app will only be used for the purposes outlined in our Privacy Policy.',
              ),
              SizedBox(height: 8.0),
              Text(
                '2. We may collect and store information about your device and how you use the app, including but not limited to, your location, IP address, and usage patterns.',
              ),
              SizedBox(height: 8.0),
              Text(
                '3. We may use cookies or similar technologies to enhance your experience with the app.',
              ),
              SizedBox(height: 24.0),
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                'If you have any questions or concerns about these terms and conditions, please contact us at blooddonorbd.island@gmail.com.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
