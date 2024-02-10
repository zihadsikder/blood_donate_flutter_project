import 'package:flutter/material.dart';

import '../../auth/views/widgets/location_form.dart';
import 'widget/aleart_cancel_button.dart';

class AccountUpdateDialoge extends StatefulWidget {
  const AccountUpdateDialoge({super.key});

  @override
  State<AccountUpdateDialoge> createState() => _AccountUpdateDialogeState();
}

class _AccountUpdateDialogeState extends State<AccountUpdateDialoge> {

  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();

  String selectedBloodGroup = 'A+';
  String selectedDivision = 'Select Division';
  String selectedDistrict = ' ';
  String selectedUpzila =' ';
  String selectedUnion =' ';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Text("Edit Your Profile", style: TextStyle(fontSize: 16)),
          const Spacer(),
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.highlight_remove_outlined))
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
            ),
            Container(height: 1, color: Colors.grey.shade100),
            TextFormField(
              controller: _mobileTEController,
              decoration: const InputDecoration(
                hintText: ('Mobile'),
              ),
            ),
            Container(height: 1, color: Colors.grey.shade100),
            TextFormField(
              controller: _emailTEController,
              decoration: const InputDecoration(
                hintText: ('Email'),
              ),
            ),
            Container(height: 1, color: Colors.grey.shade100),
            const SizedBox(height: 8.0),
            // LocationFormScreen(
            //   selectedBloodGroup: selectedBloodGroup,
            //   selectedDivision: selectedDivision,
            //   selectedDistrict: selectedDistrict,
            //   selectedUpzila: selectedUpzila,
            //   selectedUnion: selectedUnion,
            //   onBloodGroupSelected: (bloodGroup) {
            //     setState(() {
            //       selectedBloodGroup = bloodGroup;
            //     });
            //   },
            // ),
            //Container(height: 1, color: Colors.grey.shade100),

            //Container(height: 1, color: Colors.grey.shade100),
          ],
        ),
      ),
      actions: [
        const AlertCancelButton(),
        TextButton(onPressed: (){},
          style: TextButton.styleFrom(
              backgroundColor: Colors.red.shade800
          ),
          child: const Text('Save', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}