import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchDonorPage extends StatelessWidget {
  final String name;
  final String bloodGroup;
  final String lastDonation;
  final String totalDonations;
  final String address;
  final String mobile;

  final DateTime lastDonationDate;
  final bool isEligibleToDonate;

  const SearchDonorPage({
    super.key,
    required this.name,
    required this.bloodGroup,
    required this.lastDonation,
    required this.totalDonations,
    required this.address,
    required this.mobile,
    required this.lastDonationDate,
    required this.isEligibleToDonate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Row(
            children: [
              Text(
                '$name  ',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //Spacer(), // Adds spacing between name and blood group
              Container(
                width: 36, // Adjust the width as needed
                height: 36, // Adjust the height as needed
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors
                      .grey.shade200, // You can change the color as needed
                ),
                child: Center(
                  child: Text(
                    bloodGroup,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade900,
                    ),
                  ),
                ),
              ),
              //const Icon(Icons.lock)
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Last Donation: $lastDonation'),
              Text('Total Donations: $totalDonations'),
              Text('Address: $address'),
            ],
          ),
          // Add call and sms buttons here
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Show lock icon if the user is not eligible to donate
              if (!isEligibleToDonate) Icon(Icons.lock, color: Colors.red.shade800),

              // Show call and SMS buttons if the user is eligible to donate
              if (isEligibleToDonate) ...[
                IconButton(
                  icon: Icon(Icons.phone, color: Colors.red.shade800),
                  onPressed: () {
                    _launchPhoneDialer(mobile);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.sms, color: Colors.red.shade800),
                  onPressed: () {
                    _launchSmsApp(mobile);
                  },
                ),
              ],
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

_launchSmsApp(String phoneNumber) async {
  final smsUri =  Uri.parse('sms:$phoneNumber');

  if (await canLaunchUrl(smsUri)) {
    await launchUrl(smsUri);
  } else {
    // Handle error, for example, show an error message
    throw 'Could not launch';
  }
}

_launchPhoneDialer(String phoneNumber) async {
  final url = Uri.parse('tel:$phoneNumber');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}