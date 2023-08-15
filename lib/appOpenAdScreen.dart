import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class appOpenAdScreen extends StatefulWidget {
  const appOpenAdScreen({Key? key}) : super(key: key);

  @override
  State<appOpenAdScreen> createState() => _appOpenAdScreenState();
}

class _appOpenAdScreenState extends State<appOpenAdScreen> {
  bool isLoaded = false;
  AppOpenAd? openAppAd;
  var rewardAdUnitId = "ca-app-pub-3940256099942544/3419835294"; // TODO use this for testing

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // TODO use for reward ads
    createInterstitialAd();
  }

  // TODO use for interstitial ads

  createInterstitialAd() {
    AppOpenAd.load(adLoadCallback: AppOpenAdLoadCallback(
      onAdLoaded: ( ad) {
        setState(() {
          isLoaded = true;
        });
        if (kDebugMode) {
          print('$ad InterstitialAd loaded');
        }
        openAppAd= ad;
        openAppAd!.setImmersiveMode(true);
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
    ),
      // adUnitId: AdKeyHelper.interstitialAdUnitId,
      adUnitId: rewardAdUnitId,
      request: const AdRequest(contentUrl: "https://manyainvestment.github.io/"), orientation: 10,
    );
  }

  showRewardAd() {
    if (openAppAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    openAppAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdClicked: (ad) {
        print("on click ad ${ad}");
      },
      onAdShowedFullScreenContent: (AppOpenAd ad) => print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (AppOpenAd ad) {
        if (kDebugMode) {
          print('$ad onAdDismissedFullScreenContent.');
        }
        ad.dispose();
        createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (AppOpenAd ad, AdError error) {
        if (kDebugMode) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
        }
        ad.dispose();
        createInterstitialAd();
      },
    );
    openAppAd!.show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reward Ad Screen")),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Reward Ad Screen"),
          isLoaded
              ? ElevatedButton(
              onPressed: () {
                showRewardAd();
              },
              child: Text("Show Reward Ad"))
              : CircularProgressIndicator()
        ]),
      ),
    );
  }
}
