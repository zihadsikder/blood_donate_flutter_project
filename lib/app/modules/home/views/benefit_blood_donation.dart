import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BenefitBloodDonation extends StatelessWidget {
  const BenefitBloodDonation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: const Text('Benefits of Donating Blood'),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.red.shade800,
            statusBarIconBrightness: Brightness.light),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'শারীরিক ও মানসিকভাবে সুস্থ ১৮ থেকে ৬৫ বছর বয়সী যে কেউ নিয়মিত অন্যকে রক্ত দিতে পারেন। তবে রক্ত দিতে চাইলে কিছু বিষয়ে জেনে নেওয়া দরকার।',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* রক্তদাতা নিজে কখনো অনিরীক্ষিত রক্ত অথবা রক্তের উপাদান গ্রহণ করে থাকলে নিজে থেকেই রক্তদান থেকে বিরত থাকা উচিত।',
              ),
              SizedBox(height: 12.0),
              Text(
                '* শিরায় কোনোরকম নেশাযুক্ত ওষুধ নেওয়ায় অভ্যস্ত থাকলে রক্তদান করবেন না।',
              ),
              SizedBox(height: 8.0),
              Text(
                '* একাধিক ব্যক্তির সঙ্গে অরক্ষিত যৌন মিলনের অভ্যাস থাকলে রক্তদান থেকে বিরত থাকবেন।',
              ),
              SizedBox(height: 8.0),
              Text(
                '* কোনো সংক্রামক রোগের কারণে অ্যান্টিবায়োটিক সেবনের ১৪ দিনের মধ্যে রক্তদান থেকে বিরত থাকুন।',
              ),
              SizedBox(height: 24.0),
              Text(
                'রক্তদানের উপকার',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                '* অপরকে রক্ত দেওয়ার মাধ্যমে আপনি বহু মানুষের জীবন রক্ষা করতে পারেন। এই অনুভূতি অনন্য। এটি আপনার মনকেও প্রশান্তি দেবে।',
              ),
              SizedBox(height: 8.0),
              Text(
                '* নিয়মিত রক্তদানে অভ্যস্ত মানুষের উচ্চ রক্তচাপ, ডায়াবেটিস, উচ্চ কোলেস্টেরল, হার্টের রোগের ঝুঁকি কমে।',
              ),
              SizedBox(height: 8.0),
              Text(
                '* শরক্তদানের পদ্ধতির মধ্য দিয়ে গেলে আপনার শরীরে যদি কোনো অপ্রত্যাশিত রোগ থাকে; যেমন আয়রনের ঘাটতি, হেপাটাইটিস, ম্যালেরিয়া, এইচআইভি, সিফিলিস, তা জানতে পারবেন।',
              ),
              SizedBox(height: 8.0),
              Text(
                '* বিশেষ কিছু রক্তদান প্রক্রিয়ার মাধ্যমে রোগীর প্লাটিলেট সংগ্রহের সময় প্লাটিলেট কাউন্টও জানা যায়।',
              ),
              SizedBox(height: 8.0),
              Text(
                '* কআগে থেকে উচ্চ কোলেস্টেরল থাকলে নিয়মিত রক্তদানে কোলেস্টেরলের মাত্রা কমে যায়।',
              ),
              SizedBox(height: 8.0),
              Text(
                'রক্তের বিভিন্ন রোগ যেমন থ্যালাসেমিয়া, অপ্লাস্টিক অ্যানিমিয়া, ক্যানসারে আক্রান্ত রোগীদের প্রতিনিয়ত রক্তের প্রয়োজন হয়। তা ছাড়া নারীদের সন্তান প্রসবের সময়, বিভিন্ন অস্ত্রোপচারের আগে ও পরে রক্তের প্রয়োজন হয়। কোনো দুর্ঘটনা ঘটলেও প্রচুর রক্তের প্রয়োজন হতে পারে। আমাদের দেশের মোট জনসংখ্যা অনুযায়ী ব্লাডব্যাংকে যত রক্ত থাকার কথা, তার চেয়ে অনেক কম আছে। একমাত্র স্বেচ্ছায় রক্তদান কর্মসূচি বাড়িয়ে এই রক্তের জোগান দেওয়া সম্ভব। তাই রক্ত নিজে দেওয়া এবং অন্যকেও রক্ত দিতে উৎসাহ দেওয়া উচিত।',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
