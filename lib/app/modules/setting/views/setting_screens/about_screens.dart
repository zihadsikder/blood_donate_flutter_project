import 'package:blood_bd/app/modules/home/views/widgets/banner_carousel.dart';
import 'package:blood_bd/app/modules/setting/controllers/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/app_bar_widgets.dart';

class AboutInfoScreen extends StatelessWidget {
  AboutInfoScreen({super.key});

  final settingController = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidgets(title: 'About Us'),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                buildBannerCarousel,
                const SizedBox(height: 8.0),
                buildContainer,
                const SizedBox(
                  height: 16.0,
                ),
                aboutText,
              ],
            ),
          ),
        ),
      ),
    );
  }

  BannerCarousel get buildBannerCarousel {
    return const BannerCarousel(
      imageUrls: [
        AppAssets.about1,
        AppAssets.about2,
        AppAssets.about3,
        AppAssets.about4,
        AppAssets.about5,
        AppAssets.about6,
        AppAssets.about7,
      ],
    );
  }

  Container get buildContainer {
    return Container(
      color: Colors.grey.shade200,
      child: Row(
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: InkWell(
              onTap: () {
                launch(
                  'https://www.facebook.com/provater.surjo.foundation?mibextid=ZbWKwL',
                );
              },
              child: const Icon(Icons.facebook_outlined, size: 48),
            ),
          ),
          SizedBox(
            height: 56,
            width: 56,
            child: IconButton(
              onPressed: () {
                launch('https://blooddonorbd.com/');
                // Display an Interstitial Ad
                // settingController.showInterstitialAd(() {
                //   launch('https://blooddonorbd.com/');
                // });
              },
              icon: Image.asset('assets/webicon.png'),
            ),
          ),
          IconButton(
            onPressed: () {
              const appLink =
                  'https://play.google.com/store/apps/details?id=roktersondane.com ';
              Share.share('Check out this awesome app: $appLink');
              //Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.share_outlined,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }

  Text get aboutText {
    return const Text(
      'মানুষের সেবা করার দৃঢ় প্রত্যয় নিয়ে ২০১৯'
      ' সালের ২৮ জুন আমরা "প্রভাতের সূর্য"'
      ' নামে একটি অরাজনৈতিক সামাজিক সংগঠন '
      'প্রতিষ্ঠা করি "আলোর পথে হাটবে তুমি, দেখবে'
      ' পুরো বিশ্ব" এই স্লোগান সামনে রেখে প্রথমে আমরা'
      ' বস্তি এলাকার সুবিধা বঞ্চিত শিশুদের কে অস্থায়ী স্কুলের'
      ' মাধ্যমে বিনামূল্যে শিক্ষাক্রম চালিয়ে আসি। এবং মুমূর্ষু রোগীদের'
      ' জন্য ফেসবুকে "প্রভাতের সূর্য ব্লাড ব্যাংক" নামে একটি গ্রুপ খুলে'
      ' বিনামূল্যে ব্লাড ডোনাশেন কার্যক্রম শুরু করি যা বর্তমানে এখনো চলমান।'
      ' সেই লক্ষে আমরা ২০২৪ সালে "রক্তের সন্ধ্যানে" নামে সম্পূর্ণ বিনামূল্যে এই এ্যাপসটি '
      'Play Store এ publish করি যাতে একজন রক্তগ্রহিতা খুব সহজেই রক্তদাতার'
      'সন্ধ্যান পায়। আমরা চেষ্টা করে যচ্ছি যাতে ব্লাড এর অভাবে কোনো মানুষ মারা না যায়'
      ' এবং ব্লাড ডোনেশন প্রক্রিয়া কিভাবে আরো সহজ করা যায় সেই লক্ষ্যে এই এ্যাপসটি বেশি'
      ' বেশি শেয়ার করুন এবং আত্মীয়-স্বজন ও বন্ধু-বান্ধবদের সঠিক তথ্য প্রদান করে এই এ্যাপসটি'
      ' ব্যবহারে উদ্বুদ্ধ করুন। বর্তামানে আমাদের App Version ও Web Version চালু '
      'আছে www.blooddonorbd.com নামে। আমাদের এ অগ্রযাত্রায় আমরা সবসময় '
      'আপনাদের কাছ থেকে দোয়া প্রত্যাশী। এছাড়াও যে কোনো ধরণের সহযোগীতায় আমাদের '
      'সাপোর্ট টিম আছে আপনাদের পাশে। এবং ডেভেলপার সম্পর্কে জানতে Setting Screen'
          ' হতে About Us এ Double click করুন |',
    );
  }
}

