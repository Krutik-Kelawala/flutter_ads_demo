import 'package:flutter/material.dart';
import 'package:flutter_ads_demo/adClass.dart';
import 'package:flutter_ads_demo/appOpenAdScreen.dart';
import 'package:flutter_ads_demo/bannerAdScreen.dart';
import 'package:flutter_ads_demo/intersitialAdScreen.dart';
import 'package:flutter_ads_demo/rewardAdScreen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ads Dashboard")),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return bannerAdScreen();
                  },
                ));
              },
              child: Text("Banner Ads")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return intersitialAdScreen();
                  },
                ));
              },
              child: Text("Intersitial Ads")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return rewardAdScreen();
                  },
                ));
              },
              child: Text("Reward Ads")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return appOpenAdScreen();
                  },
                ));
              },
              child: Text("Open App Ads"))
        ]),
      ),
    );
  }
}
