import 'dart:async';

import 'package:bytedance_pangolin/bytedance_pangolin.dart' as Pangolin;
import 'package:flutter/material.dart';

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
  final _bytedancePangolinPlugin = Pangolin.BytedancePangolin();

  @override
  void initState() {
    super.initState();
    initPlatformState();

    _bytedancePangolinPlugin.pangolinResponseEventHandlers().listen((value) {
      if (value is Pangolin.RewardResponse) {
        print("激励视频回调：${value.rewardVerify}");
        print("激励视频回调：${value.rewardName}");
        print("激励视频回调：${value.rewardAmount}");

        if (value.rewardName == "rewardVideo Close") {
          debugPrint("视频关闭了");
        }
      } else {
        print("回调类型不符合");
      }
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;

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
    });
    if (!mounted) return;
  }

  _loadRewardAd() async {
    await _bytedancePangolinPlugin.loadRewardAd(
        isHorizontal: false,
        debug: true,
        mCodeId: "945344872",
        supportDeepLink: true,
        rewardName: "金币",
        rewardAmount: 2,
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
        topMargin: 50);
  }

  _removeBannerAd() async {
    _bytedancePangolinPlugin.removeBannerAd();
  }

  _loadInterstitialAd() async {
    await _bytedancePangolinPlugin.loadInterstitialAd(
        mCodeId: "945344417", expressViewWidth: 600, expressViewHeight: 600);
  }

  // InkWell(
  // onTap: () {
  // _loadRewardAd();
  // },
  // child: Container(
  // color: Colors.red,
  // width: 200,
  // height: 100,
  // child: Text("按钮"),
  // ),
  // )

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              ListTile(
                title: const Text("banner广告"),
                onTap: () {
                  _loadBannerAd();
                },
              ),
              const Divider(height: 1.0),
              ListTile(
                title: const Text(
                  "删除banner",
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  _removeBannerAd();
                },
              ),
              const Divider(height: 1.0),
              ListTile(
                title: const Text("插屏广告"),
                onTap: () {
                  _loadInterstitialAd();
                },
              ),
              const Divider(height: 1.0),
              ListTile(
                title: const Text("激励广告"),
                onTap: () {
                  _loadRewardAd();
                },
              ),
              const Divider(height: 1.0),
              ListTile(
                title: const Text("开屏广告"),
                onTap: () {
                  _loadSplashAd();
                },
              ),
              const Divider(height: 1.0),
            ],
          ),
        ),
      ),
    );
  }
}
