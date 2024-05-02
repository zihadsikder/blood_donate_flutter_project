import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widget/privacy_text.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: const Text('Privacy Policy'),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.red.shade800,
            statusBarIconBrightness: Brightness.light),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: PrivacyText.privacyPolicy1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Text(PrivacyText.privacyPolicy),
            ],
          ),
        ),
      ),
    );
  }
}
