import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bytedance_pangolin_platform_interface.dart';

const int NETWORK_STATE_MOBILE = 1;
const int NETWORK_STATE_2G = 2;
const int NETWORK_STATE_3G = 3;
const int NETWORK_STATE_WIFI = 4;
const int NETWORK_STATE_4G = 5;

const int ORIENTATION_VERTICAL = 1;
const int ORIENTATION_HORIZONTAL = 2;

/// An implementation of [BytedancePangolinPlatform] that uses method channels.
class MethodChannelBytedancePangolin extends BytedancePangolinPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bytedance_pangolin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> register({
    required String appId,
    required bool useTextureView,
    required String appName,
    required bool allowShowNotify,
    required bool allowShowPageWhenScreenLock,
    required bool debug,
    required bool supportMultiProcess,
    List<int>? directDownloadNetworkType,
  }) async {
    bool? isRegister = await methodChannel.invokeMethod<bool>('register', {
      "appId": appId,
      "useTextureView": useTextureView,
      "appName": appName,
      "allowShowNotify": allowShowNotify,
      "allowShowPageWhenScreenLock": allowShowPageWhenScreenLock,
      "debug": debug,
      "supportMultiProcess": supportMultiProcess,
      "directDownloadNetworkType": directDownloadNetworkType ??
          [
            NETWORK_STATE_MOBILE,
            NETWORK_STATE_3G,
            NETWORK_STATE_4G,
            NETWORK_STATE_WIFI
          ]
    });
    return isRegister;
  }

  @override
  Future<bool> loadSplashAd(
      {required String mCodeId, required bool debug}) async {
    bool? isLoadSplashAd = await methodChannel.invokeMethod<bool>(
        "loadSplashAd", {"mCodeId": mCodeId, "debug": debug});

    return isLoadSplashAd!;
  }

  Future loadBannerAd(
      {required String mCodeId,
      required bool supportDeepLink,
      double? expressViewWidth,
      double? expressViewHeight,
      bool? isCarousel,
      int? interval,
      int? topMargin}) async {
    return await methodChannel.invokeMethod("loadBannerAd", {
      "mCodeId": mCodeId,
      "supportDeepLink": supportDeepLink,
      "expressViewWidth": expressViewWidth,
      "expressViewHeight": expressViewHeight,
      "isCarousel": isCarousel,
      "interval": interval,
      "topMargin": topMargin
    });
  }

  Future loadInterstitialAd(
      {required String mCodeId,
      double? expressViewWidth,
      double? expressViewHeight}) async {
    return await methodChannel.invokeMethod("loadInterstitialAd", {
      "mCodeId": mCodeId,
      "expressViewWidth": expressViewWidth,
      "expressViewHeight": expressViewHeight,
    });
  }

  Future loadFullScreenVideoAd(
      {required String mCodeId,
      double? expressViewWidth,
      double? expressViewHeight,
      int orientation = ORIENTATION_VERTICAL}) async {
    return await methodChannel.invokeMethod("loadFullScreenVideoAd", {
      "mCodeId": mCodeId,
      "expressViewWidth": expressViewWidth,
      "expressViewHeight": expressViewHeight,
      "orientation": orientation,
    });
  }

  Future loadRewardAd({
    required String mCodeId,
    required bool debug,
    required bool supportDeepLink,
    required String rewardName,
    required int rewardAmount,
    required bool isExpress,
    double? expressViewAcceptedSizeH,
    double? expressViewAcceptedSizeW,
    required userID,
    String? mediaExtra,
    required bool isHorizontal,
  }) async {
    return await methodChannel.invokeMethod("loadRewardAd", {
      "mCodeId": mCodeId,
      "debug": debug,
      "supportDeepLink": supportDeepLink,
      "rewardName": rewardName,
      "rewardAmount": rewardAmount,
      "isExpress": isExpress,
      "expressViewAcceptedSizeH": expressViewAcceptedSizeH,
      "expressViewAcceptedSizeW": expressViewAcceptedSizeW,
      "userID": userID,
      "mediaExtra": mediaExtra,
      "isHorizontal": isHorizontal,
    });
  }

  Future removeBannerAd() async {
    await methodChannel.invokeMethod("removeBannerAd");
  }
}
