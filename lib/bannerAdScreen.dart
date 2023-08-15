import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class bannerAdScreen extends StatefulWidget {
  const bannerAdScreen({Key? key}) : super(key: key);

  @override
  State<bannerAdScreen> createState() => _bannerAdScreenState();
}

class _bannerAdScreenState extends State<bannerAdScreen> {
  bool isBannerAdReady = false;
  late BannerAd bannerAd;
  var adUnitId = "ca-app-pub-3940256099942544/6300978111"; // TODO use this for testing

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // TODO use for banner ads
    loadBannerAd();
  }

  // TODO use for banner ads

  loadBannerAd() {
    bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(contentUrl: "https://manyainvestment.github.io/"),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdClicked: (ad) {
          if (kDebugMode) {
            print("on click ${ad.adUnitId} ${ad.responseInfo}");
          }
        },
        onAdLoaded: (ad) {
          setState(() {
            isBannerAdReady = true;
            if (kDebugMode) {
              print("on loaded ${ad.responseInfo} ${ad.adUnitId}");
            }
          });
        },
        onAdFailedToLoad: (ad, err) {
          isBannerAdReady = false;
          if (kDebugMode) {
            print("onAdFailedToLoad ${ad.responseInfo.toString()} ${ad.adUnitId}");
            print("onAdFailedToLoad err ${err.responseInfo} ${err.code} ${err.domain} ${err.message}");
          }
        },
      ),
    );

    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Banner Ads")),
        body: const Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Banner Ads"),
            // TODO Set at middle screen
            /*isBannerAdReady
                ? Container(
                    width: bannerAd.size.width.toDouble(),
                    height: bannerAd.size.height.toDouble(),
                    child: AdWidget(ad: bannerAd),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  )*/
          ]),
        ),
        // TODO set at bottom screen
        bottomNavigationBar: isBannerAdReady
            ? Container(
                width: bannerAd.size.width.toDouble(),
                height: bannerAd.size.height.toDouble(),
                child: AdWidget(ad: bannerAd),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
