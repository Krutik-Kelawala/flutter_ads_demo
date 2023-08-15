import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class intersitialAdScreen extends StatefulWidget {
  const intersitialAdScreen({Key? key}) : super(key: key);

  @override
  State<intersitialAdScreen> createState() => _intersitialAdScreenState();
}

class _intersitialAdScreenState extends State<intersitialAdScreen> {
  bool isLoaded = false;
  InterstitialAd? interstitialAd;
  int numInterstitialLoadAttempts = 0;
  var interstitialAdUnitId = "ca-app-pub-3940256099942544/1033173712"; // TODO use this for testing

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // TODO use for interstitial ads
    createInterstitialAd();
  }

  // TODO use for interstitial ads

  createInterstitialAd() {
    InterstitialAd.load(
        // adUnitId: AdKeyHelper.interstitialAdUnitId,
        adUnitId: interstitialAdUnitId,
        request: const AdRequest(contentUrl: "https://manyainvestment.github.io/"),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            setState(() {
              isLoaded = true;
            });
            if (kDebugMode) {
              print('$ad InterstitialAd loaded');
            }
            interstitialAd = ad;
            numInterstitialLoadAttempts = 0;
            interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            setState(() {
              isLoaded = false;
            });
            if (kDebugMode) {
              print('InterstitialAd failed to load: $error.');
            }
            /*numInterstitialLoadAttempts += 1;
            if (numInterstitialLoadAttempts < 1) {
              createInterstitialAd();
            }*/
          },
        ));
  }

  showInterstitialAd() {
    if (interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) => print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        createInterstitialAd();
      },
    );
    interstitialAd!.show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("intersitial Ad Screen")),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Show intersitial Ad"),
          isLoaded
              ? ElevatedButton(
                  onPressed: () {
                    showInterstitialAd();
                  },
                  child: const Text("show Intersitial Ads"))
              : Center(child: CircularProgressIndicator())
        ]),
      ),
    );
  }
}
