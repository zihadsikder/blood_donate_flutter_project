import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../core/utils/ad_helper.dart';

class SettingController extends GetxController {
  InterstitialAd? interstitialAd;

  @override
  void onInit() {
    super.onInit();
    loadInterstitialAd();  // Load interstitial ad when the controller is initialized
  }

  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
          interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              loadInterstitialAd();  // Reload the ad after it is dismissed
            },
            onAdFailedToShowFullScreenContent: (ad, err) {
              loadInterstitialAd();  // Reload the ad if it fails to show
            },
          );
        },
        onAdFailedToLoad: (err) {
          interstitialAd = null;
        },
      ),
    );
  }

  void showInterstitialAd(VoidCallback onAdDismissed) {
    if (interstitialAd != null) {
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          onAdDismissed();
          loadInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (ad, err) {
          onAdDismissed();
          loadInterstitialAd();
        },
      );
      interstitialAd!.show();
    } else {
      onAdDismissed();
    }
  }
}
