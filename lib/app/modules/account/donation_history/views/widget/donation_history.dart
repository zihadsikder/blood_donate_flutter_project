import 'package:blood_donate_flutter_project/app/modules/account/donation_history/views/donation_history_view.dart';
import 'package:flutter/material.dart';

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
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) =>
                   const DonationHistoryView());
        },
        child:const Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(

              children: [
                Text('Donation History',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
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