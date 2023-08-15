import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class rewardAdScreen extends StatefulWidget {
  const rewardAdScreen({Key? key}) : super(key: key);

  @override
  State<rewardAdScreen> createState() => _rewardAdScreenState();
}

class _rewardAdScreenState extends State<rewardAdScreen> {
  bool isLoaded = false;
  RewardedAd? rewardedAd;
  var rewardAdUnitId = "ca-app-pub-3940256099942544/5224354917"; // TODO use this for testing

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // TODO use for reward ads
    createInterstitialAd();
  }

  // TODO use for interstitial ads

  createInterstitialAd() {
    RewardedAd.load(
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          setState(() {
            isLoaded = true;
          });
          if (kDebugMode) {
            print('$ad InterstitialAd loaded');
          }
          rewardedAd = ad;
          rewardedAd!.setImmersiveMode(true);
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
      request: const AdRequest(contentUrl: "https://manyainvestment.github.io/"),
    );
  }

  showRewardAd() {
    if (rewardedAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdClicked: (ad) {
        print("on click ad ${ad}");
      },
      onAdShowedFullScreenContent: (RewardedAd ad) => print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        if (kDebugMode) {
          print('$ad onAdDismissedFullScreenContent.');
        }
        ad.dispose();
        createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        if (kDebugMode) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
        }
        ad.dispose();
        createInterstitialAd();
      },
    );
    rewardedAd!.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      if (kDebugMode) {
        print('$ad onAdFailedToShowFullScreenContent: $ad ${reward.amount} ${reward.type}');
      }
    });
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
