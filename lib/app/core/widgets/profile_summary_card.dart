import 'package:blood_donate_flutter_project/app/modules/home/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSummaryCard extends StatefulWidget {
  const ProfileSummaryCard({
    super.key,
    this.enableOnTap = true,
  });

  final bool enableOnTap;

  @override
  State<ProfileSummaryCard> createState() => _ProfileSummaryCardState();
}

class _ProfileSummaryCardState extends State<ProfileSummaryCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset('assets/blogo.png'),
      ),
      title: const Text(
        'GIVE BLOOD  SAVE LIFE',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      subtitle: const Text(
        'To be a Hero! Donate Blood.',
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
      trailing: IconButton(
        onPressed: () async {
         Get.to(()=> SearchScreenView());

        },
        icon: const Icon(Icons.search_outlined, color: Colors.white),
      ),
      tileColor: Colors.red.shade900,
    );
  }
}