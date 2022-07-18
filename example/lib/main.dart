import 'dart:async';

import 'package:bytedance_pangolin/bytedance_pangolin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _bytedancePangolinPlugin = BytedancePangolin();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _bytedancePangolinPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    await _bytedancePangolinPlugin
        .register(
            appId: "5073083",
            useTextureView: true,
            appName: "tgame",
            allowShowNotify: true,
            allowShowPageWhenScreenLock: true,
            debug: true,
            supportMultiProcess: true)
        .then((value) {
      platformVersion = '已注册sdk';
      setState(() {
        _platformVersion = platformVersion;
      });
      // _loadSplashAd();
      // _loadBannerAd();
      _loadRewardAd();
      // _loadInterstitialAd();
    });
    if (!mounted) return;
  }

  _loadRewardAd() async {
    await _bytedancePangolinPlugin.loadRewardAd(
        isHorizontal: false,
        debug: true,
        mCodeId: "945344872",
        supportDeepLink: true,
        rewardName: "激励广告",
        rewardAmount: 3,
        isExpress: true,
        expressViewAcceptedSizeH: 500,
        expressViewAcceptedSizeW: 500,
        userID: "user123",
        mediaExtra: "media_extra");
  }

  // 开屏广告
  _loadSplashAd() async {
    _bytedancePangolinPlugin.loadSplashAd(mCodeId: "887343401", debug: false);
  }

  _loadBannerAd() async {
    await _bytedancePangolinPlugin.loadBannerAd(
        mCodeId: "949248774",
        supportDeepLink: true,
        expressViewWidth: 320,
        expressViewHeight: 50,
        isCarousel: true,
        interval: 40,
        topMargin: 300);
  }

  _removeBannerAd() async {
    _bytedancePangolinPlugin.removeBannerAd();
  }

  _loadInterstitialAd() async {
    await _bytedancePangolinPlugin.loadInterstitialAd(
        mCodeId: "945344417", expressViewWidth: 600, expressViewHeight: 600);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
