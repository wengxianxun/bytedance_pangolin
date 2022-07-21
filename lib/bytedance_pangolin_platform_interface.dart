import 'dart:async';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bytedance_pangolin_method_channel.dart';

abstract class BytedancePangolinPlatform extends PlatformInterface {
  /// Constructs a BytedancePangolinPlatform.
  BytedancePangolinPlatform() : super(token: _token);

  static final Object _token = Object();

  static BytedancePangolinPlatform _instance = MethodChannelBytedancePangolin();

  /// The default instance of [BytedancePangolinPlatform] to use.
  ///
  /// Defaults to [MethodChannelBytedancePangolin].
  static BytedancePangolinPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BytedancePangolinPlatform] when
  /// they register themselves.
  static set instance(BytedancePangolinPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

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
    throw UnimplementedError('register() 还没注册.');
  }

  Future<bool> loadSplashAd(
      {required String mCodeId, required bool debug}) async {
    throw UnimplementedError('loadSplashAd() 还没实现.');
  }

  Future loadBannerAd(
      {required String mCodeId,
      required bool supportDeepLink,
      double? expressViewWidth,
      double? expressViewHeight,
      bool? isCarousel,
      int? interval,
      int? topMargin}) async {
    throw UnimplementedError('loadBannerAd() 还没实现.');
  }

  Future loadInterstitialAd(
      {required String mCodeId,
      double? expressViewWidth,
      double? expressViewHeight}) async {
    throw UnimplementedError('loadInterstitialAd() 还没实现.');
  }

  Future loadFullScreenVideoAd(
      {required String mCodeId,
      double? expressViewWidth,
      double? expressViewHeight,
      int orientation = ORIENTATION_VERTICAL}) async {
    throw UnimplementedError('loadFullScreenVideoAd() 还没实现.');
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
    throw UnimplementedError('loadRewardAd() 还没实现.');
  }

  Future removeBannerAd() async {
    throw UnimplementedError('removeBannerAd() 还没实现.');
  }
}
