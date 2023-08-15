import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdKeyHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      // Add android key here
      return "ca-app-pub-1568334059582060/1914249959";
    } else if (Platform.isIOS) {
      // ADD ios key here
      return "ca-app-pub-1568334059582060/1914249959";
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      // Add android key here
      return "ca-app-pub-1568334059582060/8555943259";
    } else if (Platform.isIOS) {
      // ADD ios key here
      return "ca-app-pub-1568334059582060/8555943259";
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardAdUnitId {
    if (Platform.isAndroid) {
      // Add android key here
      return "ca-app-pub-1568334059582060/8625646892";
    } else if (Platform.isIOS) {
      // ADD ios key here
      return "ca-app-pub-1568334059582060/8625646892";
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
}
