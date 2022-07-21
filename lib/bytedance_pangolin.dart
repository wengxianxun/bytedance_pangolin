import 'dart:async';

import 'package:bytedance_pangolin/bytedance_pangolin_response.dart';

import 'bytedance_pangolin_method_channel.dart';
import 'bytedance_pangolin_platform_interface.dart';

export 'bytedance_pangolin_response.dart';

class BytedancePangolin {
  Stream<BasePangolinResponse> pangolinResponseEventHandlers() {
    return pangolinResponseEventHandler;
  }

  // 注册sdk
  Future<bool?> register({
    required String appId,
    required bool useTextureView,
    required String appName,
    required bool allowShowNotify,
    required bool allowShowPageWhenScreenLock,
    required bool debug,
    required bool supportMultiProcess,
    List<int>? directDownloadNetworkType,
  }) {
    return BytedancePangolinPlatform.instance.register(
        appId: appId,
        useTextureView: useTextureView,
        appName: appName,
        allowShowNotify: allowShowNotify,
        allowShowPageWhenScreenLock: allowShowPageWhenScreenLock,
        debug: debug,
        supportMultiProcess: supportMultiProcess,
        directDownloadNetworkType: directDownloadNetworkType);
  }

  // 开屏广告
  Future<bool> loadSplashAd(
      {required String mCodeId, required bool debug}) async {
    return BytedancePangolinPlatform.instance
        .loadSplashAd(mCodeId: mCodeId, debug: debug);
  }

  // banner广告
  Future loadBannerAd(
      {required String mCodeId,
      required bool supportDeepLink,
      double? expressViewWidth,
      double? expressViewHeight,
      bool? isCarousel,
      int? interval,
      int? topMargin}) async {
    return BytedancePangolinPlatform.instance.loadBannerAd(
        mCodeId: mCodeId,
        supportDeepLink: supportDeepLink,
        expressViewWidth: expressViewWidth,
        expressViewHeight: expressViewHeight,
        isCarousel: isCarousel,
        interval: interval,
        topMargin: topMargin);
  }

  Future loadInterstitialAd(
      {required String mCodeId,
      double? expressViewWidth,
      double? expressViewHeight}) async {
    return BytedancePangolinPlatform.instance.loadInterstitialAd(
        mCodeId: mCodeId,
        expressViewWidth: expressViewWidth,
        expressViewHeight: expressViewHeight);
  }

  Future loadFullScreenVideoAd(
      {required String mCodeId,
      double? expressViewWidth,
      double? expressViewHeight,
      int orientation = ORIENTATION_VERTICAL}) async {
    return BytedancePangolinPlatform.instance.loadFullScreenVideoAd(
        mCodeId: mCodeId,
        expressViewWidth: expressViewWidth,
        expressViewHeight: expressViewHeight,
        orientation: orientation);
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
    return BytedancePangolinPlatform.instance.loadRewardAd(
        mCodeId: mCodeId,
        debug: debug,
        supportDeepLink: supportDeepLink,
        rewardName: rewardName,
        rewardAmount: rewardAmount,
        isExpress: isExpress,
        userID: userID,
        isHorizontal: isHorizontal);
  }

  Future removeBannerAd() async {
    return BytedancePangolinPlatform.instance.removeBannerAd();
  }
}
