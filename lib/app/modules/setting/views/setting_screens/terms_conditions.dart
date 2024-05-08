import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Terms of Use',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              '1. By using this app, you agree to abide by these terms and conditions.',
            ),
            SizedBox(height: 8.0),
            Text(
              '2. This app is intended for use by individuals who are eligible to donate blood according to government regulations.',
            ),
            SizedBox(height: 8.0),
            Text(
              '3. We reserve the right to modify or terminate the service for any reason, without notice, at any time.',
            ),
            SizedBox(height: 8.0),
            Text(
              '4. You agree not to misuse the app, including but not limited to, attempting to access data not intended for you or logging into a server or account that you are not authorized to access.',
            ),
            SizedBox(height: 8.0),
            Text(
              '5. We are not liable for any damages or losses resulting from your use of the app.',
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
    );
  }
}
