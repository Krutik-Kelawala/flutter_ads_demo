import 'package:flutter/material.dart';
import 'package:flutter_ads_demo/homePage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize(); //<-- SEE HERE

  /*RequestConfiguration requestConfiguration = RequestConfiguration(testDeviceIds: ["FF80ADCFB692311DD59C89509D5004DD"]);
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);*/

  runApp(MaterialApp(
    home: homePage(),
  ));
}
