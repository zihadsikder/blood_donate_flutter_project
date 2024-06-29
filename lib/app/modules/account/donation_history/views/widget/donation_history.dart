import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';

class DonationHistory extends StatelessWidget {
  const DonationHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.DONATION_HISTORY);
        },
        child: const Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Donation History',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
