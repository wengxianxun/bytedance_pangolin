<p align="center">
<img src=https://github.com/OpenFlutter/Pangolin/blob/master/showImage/new_ad_image.png alt="drawing" width="700">
</p>

<p>
<a href="https://www.npmjs.com/package/drone"><img src=https://img.shields.io/badge/license-MIT-brightgreen></a>
<a href="https://www.apple.com/lae/ios/ios-13/"><img src=https://img.shields.io/badge/platform-ios-lightgrey></a>
<a href="https://www.Android.com/package/drone"><img src=https://img.shields.io/badge/platform-Android-lightgrey></a>
<a href="https://www.dart.dev"><img src=https://img.shields.io/badge/Language-Dart-orange></a>
<a href="https://www.flutter.dev"><img src=https://img.shields.io/badge/Flutter-v1.20.1-informational></a>
<a href="https://www.dart.dev"><img src=https://img.shields.io/badge/Dart-v2.4.1-informational></a>
<a href="https://github.com/tongyangsheng/flutter_reader"><img src=https://img.shields.io/badge/Pangolin-v0.2.3-success></a>
</p>

## 注意

本插件是基于flutter3.0版本基础开发的，低版本请搜索Pangolin插件使用， 本插件是基于Pangolin插件的基础上开发改造的，由于Pangolin作者很久没更新了（好像是去某大厂修福报没空搞业余了），所以我自己重新开发，后续会随时更新维护，欢迎大家多提bug。

## 前言

⚠️ 在使用本插件前请认真，仔细阅读[穿山甲官方文档](http://partner.toutiao.com/doc?id=5dd0fe756b181e00112e3ec5)。本插件将尽量保留 SDK 内容和各 API 相关内容，如出现在官方文档以外报错信息可以留言 issue,或通过文末联系方式联系作者（注明来意）。针对你可能会遇到的问题，在使用过程中可以先查阅 👉

### [Pangolin 报错及其解决方案](https://github.com/tongyangsheng/Pangolin/blob/master/PangolinError.md)

## 公告

再次提醒，本插件基于flutter3.0开发的，低版本请勿使用。

## 简介

bytedance_pangolin 是一款 Flutter 插件，集成了字节跳动旗下的广告平台——穿山甲的 Android 和 iOS 的 SDK，方便开发者直接在 Flutter 层面调用相关方法。

## 版本信息

| 版本  |                                                    更新信息                                                    |
| :---- | :------------------------------------------------------------------------------------------------------------: |
| 0.0.1 |                                         穿山甲 SDK 接入，开屏广告实现                                          |
| 0.0.2 |                                         修复开屏广告偶现 TopBar 的 Bug                                         |
| 0.0.5 |                                             激励视频 Android 接入                                              |
| 0.0.6 |                                              激励视频接口参数重写                                              |
| 0.0.7 |                                    移除默认 Activity 直接在当前界面调起广告                                    |
| 0.0.8 |                                            紧急修复 iOS 端 报错 Bug                                            |
| 0.1.0 |                                                iOS 激励视频支持                                                |
| 0.1.1 |                                             自动下载网络环境可配置                                             |
| 0.1.2 |                                          修复了 toast 无法移除的问题                                           |
| 0.1.3 |                       修复了部分情况下 iOS 无法收到回调的问题，iOS 的开屏现在会自动关闭                        |
| 0.1.4 |                          修复了部分情况下 iOS 在使用 Cocoapods 导入 SDK 时存在的错误                           |
| 0.1.5 |                                              支持 iOS banner 广告                                              |
| 0.1.6 |                                               支持 iOS 插屏广告                                                |
| 0.1.7 |                                         修复“isExpress”参数的传递问题                                          |
| 0.1.8 |       修复部分用户 context 获取不到的问题 原因是部分用户没有走 onAttachedToEngine()，走了 registerWith()       |
| 0.1.9 | 修复部分用户 activity 获取不到的问题 原因是部分用户没有走 onAttachedToActivity() 为了满足所有用户，我太难了 😭 |
| 0.2.0 |                                            支持 Android banner 广告                                            |
| 0.2.1 |                                             支持 Android 插屏广告                                              |
| 0.2.2 |                          接入了 Flutter1.20.1 环境 新增一个 banner 广告的手动关闭方法                          |
| 0.2.3 |                                     新增了一个激励视频的回调——关闭激励视频                                     |
| 0.2.4 |                        新增 iOS Banner 广告移除方法，校验 Flutter1.22 环境下的运行情况                         |
| 0.2.5 |                                        根据 Android 最新 SDK 更新了 API                                        |
| 0.2.6 |                    测试了功能 Flutter1.22.4 修复了部分 issue 反馈的错误 采纳了部分优化建议                     |
| 0.2.7 |                                      尝试修复 Android 上的向下兼容性问题                                       |

## 插件开发环境相关

### Flutter

```
Flutter (Channel stable, v3.0.4, on Mac OS X 12.4 (21F79), locale zh-Hans-CN)
```

### Dart

```
Dart VM version: 2.17.5
```

### Platform

```
Xcode - develop for iOS and macOS (Xcode 13.4.1)

Android Studio Chipmunk | 2021.2.1 Patch 1

```

### 穿山甲

```
iOS - cocoapods lastest version
Android - implementation 'com.pangle.cn:ads-sdk-pro:4.4.0.9'
```

## 安装

```yaml
# add this line to your dependencies
dependencies:
  bytedance_pangolin: ^0.0.1
```

## 环境配置

使用前请确认您以根据穿山甲的官方文档中的步骤进行了相应的依赖添加，权限获取以及参数配置

### Android

[穿山甲 Android SDK 接入基础配置](https://partner.oceanengine.com/union/media/union/download/detail?id=4&docId=5de8d9b425b16b00113af0da&osType=android)<br>
⚠️ 说明：<br>

- 从 Android 6.0(API 23)开始，对系统权限做了很大的改变。在之前用户安装 APP 前，只是把 APP 需要使用的权限列出来给用户告知一下，APP 安装后都可以访问这些权限。从 6.0 开始，一些敏感权限，需要在使用时动态申请，并且用户可以选择拒绝授权访问这些权限，已授予过的权限，用户也可以去 APP 设置页面去关闭授权。有关动态权限的获取 pub 上有很多 package，我个人不会在插件内集成权限申请相关，方便使用者灵活配置，可根据实际需求选择相应插件和权限。

- 穿山甲官方推荐在合适时机申请用户权限，但是使用本插件前请务必确认你所需的权限已经获得用户授权。

#### iOS

[穿山甲 iOS SDK 接入基础配置](https://partner.oceanengine.com/union/media/union/download/detail?id=16&docId=5de8d570b1afac00129330c5&osType=ios)

## Pangolin 集成

### Android

在 Android 端你可能需要简单的四个小步骤导入穿山甲 SDK 具体步骤已为你写好请戳 👉

#### [Pangolin Android 集成手册](https://github.com/tongyangsheng/Pangolin/blob/master/AndroidProfile.md)

### iOS

```
pod install
```

## 穿山甲平台

在使用之前必须确认您在穿山甲平台的[控制台](https://partner.oceanengine.com/union/media/union/site)已经注册了自己 app 所对应的应用以及对应广告类型的代码位，由于穿山甲包含多种类型的广告和功能请务必确认你在插件中注册的和你在平台注册的一一对应。

## 开始使用

### 初始化（register）

调用穿山甲 SDK 的第一步是对 SDK 的初始化

```dart
final _bytedancePangolinPlugin = BytedancePangolin();

await _bytedancePangolinPlugin
        .register(
            appId: “id”,
            useTextureView: true,
            appName: “name”,
            allowShowNotify: true,
            allowShowPageWhenScreenLock: true,
            debug: true,
            supportMultiProcess: true)
        .then((value) {
       // do
    });
```

#### 参数说明

| 参数                        |                                                描述                                                | 默认值 |
| :-------------------------- | :------------------------------------------------------------------------------------------------: | -----: |
| appId                       |                                   在穿山甲平台注册的自己的 AppId                                   |   null |
| useTextureView              | 使用 TextureView 控件播放视频,默认为 SurfaceView,当有 SurfaceView 冲突的场景，可以使用 TextureView |  false |
| appName                     |                                           自己的应用名称                                           |   null |
| allowShowNotify             |                                    是否允许 sdk 展示通知栏提示                                     |   true |
| allowShowPageWhenScreenLock |                                  是否在锁屏场景支持展示广告落地页                                  |   true |
| debug                       |                        测试阶段打开，可以通过日志排查问题，上线时去除该调用                        |   true |
| supportMultiProcess         |                                           是否支持多进程                                           |  false |

- 注意以上参数大部分针对 Android 端，iOS 端由于穿山甲 SDK 本身的原因并没有过多的参数配置，有用的参数仅为 appId，appName。

#### 接入成功 debug 信息

- Android

```
E/TTAdSdk-InitChecker( 5148): ==当前进程名：com.tongyangsheng.pangolin_example
E/TTAdSdk-InitChecker( 5148): ==穿山甲sdk接入，环境为debug，初始化配置检测开始==
E/TTAdSdk-InitChecker( 5148): AndroidManifest.xml中TTMultiProvider配置正常
E/TTAdSdk-InitChecker( 5148): AndroidManifest.xml中TTFileProvider配置正常
E/TTAdSdk-InitChecker( 5148): AndroidManifest.xml中权限配置正常
E/TTAdSdk-InitChecker( 5148): 动态权限正常：android.permission.READ_PHONE_STATE
E/TTAdSdk-InitChecker( 5148): 动态权限正常：android.permission.ACCESS_COARSE_LOCATION
E/TTAdSdk-InitChecker( 5148): 动态权限正常：android.permission.ACCESS_FINE_LOCATION
E/TTAdSdk-InitChecker( 5148): 动态权限正常：android.permission.WRITE_EXTERNAL_STORAGE
E/TTAdSdk-InitChecker( 5148): ==穿山甲sdk初始化配置检测结束==
```

- iOS
  仅提示穿山甲接入成功

⚠️ 进行下一步操作前请确认，穿山甲已经成功接入并且检测正常。

### 加载开屏广告

```dart
        _bytedancePangolinPlugin.loadSplashAd(mCodeId:“codeid“, debug: false);
```

#### 参数说明

| 参数    |                         描述                         | 默认值 |
| :------ | :--------------------------------------------------: | -----: |
| mCodeId |          在穿山甲平台注册的自己的广告位 id           |   null |
| debug   | 测试阶段打开，可以通过日志排查问题，上线时去除该调用 |   true |

### 加载激励视频

激励视频的原生接入相对复杂，但是我已经给各位留好了接口，只需简单的几步就可以加载到你的激励视频<br/>
⚠️ 使用前请确认您已在穿山甲平台的[控制台](https://partner.oceanengine.com/union/media/union/site)建立了你的激励视频广告 id。<br/>

```dart
    await _bytedancePangolinPlugin.loadRewardAd(
        isHorizontal: false,
        debug: true,
        mCodeId: " 1111111 ",
        supportDeepLink: true,
        rewardName: "金币",
        rewardAmount: 2,
        isExpress: true,
        expressViewAcceptedSizeH: 500,
        expressViewAcceptedSizeW: 500,
        userID: "user123",
        mediaExtra: "media_extra");
```

#### 参数说明

| 参数                     |                                  描述                                   |      默认值 |
| :----------------------- | :---------------------------------------------------------------------: | ----------: |
| isHorizontal             |                                是否横屏                                 |       false |
| mCodeId                  |                    在穿山甲平台注册的自己的广告位 id                    |        null |
| debug                    | 此处 debug 为 true 的情况下 我会给你显示整体进程的一个 Toast 方便你调试 |        true |
| supportDeepLink          |                                是否横屏                                 |       false |
| rewardName               |                               奖励的名称                                |        null |
| rewardAmount             |                                奖励数量                                 |        null |
| isExpress                |                是否进行自渲染（传入后设置激励视频尺寸）                 |        true |
| expressViewAcceptedSizeH |                              渲染视频高度                               |         500 |
| expressViewAcceptedSizeW |                              渲染视频宽度                               |         500 |
| userID                   |   必传参数，表来标识应用侧唯一用户；若非服务器回调模式或不需 sdk 透传   |        null |
| mediaExtra               |                         用户透传的信息，可不传                          | media_extra |

### 激励视频回调监听

在合适的位置注册你的监听，保证用户看完广告时接收到我给你的回调信息，并做下一步处理

```dart
Pangolin.pangolinResponseEventHandler.listen((value)
    {
      if(value is Pangolin.RewardResponse)
        {
          print("激励视频回调：${value.rewardVerify}");
          print("激励视频回调：${value.rewardName}");
          print("激励视频回调：${value.rewardAmount}");
        }
      else
        {
          print("回调类型不符合");
        }
    });
```

#### 参数说明

| 参数         |                描述                | 默认值 |
| :----------- | :--------------------------------: | -----: |
| rewardVerify | 验证奖励有效性，即用户是否完成观看 |      / |
| rewardName   |      你在穿山甲填写的奖励名称      |      / |
| rewardAmount |      你在穿山甲填写的奖励数量      |      / |

- 激励视频关闭监听：如果你收到了一个回调，并且`rewardName == rewardVideo Close`说明是一个激励视频关闭的回调，详见 example

激励视频的具体使用参见项目目录下 Example

### 加载 Banner 广告

```dart
     await _bytedancePangolinPlugin.loadBannerAd(
        mCodeId: “your codeid“,
        supportDeepLink: true,
        expressViewWidth: 320,
        expressViewHeight: 50,
        isCarousel: true,
        interval: 40,
        topMargin: 50);
```

#### 参数说明

| 参数             |               描述                | 默认值 |
| :--------------- | :-------------------------------: | -----: |
| mCodeId          | 在穿山甲平台注册的自己的广告位 id |   null |
| supportDeepLink  |           是否支持横屏            |   true |
| expressViewWidth |            banner 长度            |   null |
| expressViewWidth |            banner 高度            |   null |
| isCarousel       |           是否开启轮播            |   true |
| interval         |      轮播间隔（30 ～ 120s）       |   null |
| topMargin        |  banner 到顶部距离（仅 Android）  |      0 |

以上参数在创建代码位时都可以进行自定义设置，请确保在代码中填写的实际值和创建代码位时一致。

### 手动关闭 Banner 广告（Android）

```dart
_bytedancePangolinPlugin.removeBannerAd();
```

该方法提供给 Android 用户，在关闭界面时手动调用，关闭 Banner 广告

### 加载插屏广告（iOS）

```dart
    await _bytedancePangolinPlugin.loadInterstitialAd(
        mCodeId: "Your CodeId",
        expressViewWidth: 300,
        expressViewHeight: 300
    );
```

#### 参数说明

| 参数             |               描述                | 默认值 |
| :--------------- | :-------------------------------: | -----: |
| mCodeId          | 在穿山甲平台注册的自己的广告位 id |   null |
| expressViewWidth |             插屏长度              |   null |
| expressViewWidth |             插屏高度              |   null |

插屏广告的长宽可以自己设定，但是长宽比必须和自己代码位设定的一致，例如设置了 1:1 的长宽比可以设置： 长度 300+宽度 300 或 长度 600+宽度 600。

## 加入/贡献

目前项目已经逐渐完善，但是还有许多特性需要给的协助，如果你对项目有兴趣并且对开源有兴趣和信心，可以通过 README 底部的联系方式联系我，并在备注中说明，我会优先回复你的信息 🤪。目前剩余的广告（按目前 issue 中提到的人数统计优先级）：

- 信息流广告

### 方法

- fork 项目代码
- 开发/测试功能
- 提出 pr

## 测试说明

穿山甲的测试个人建议在真机进行测试，我本人在模拟器上会遇到各种疑难杂症，虽然插件和穿山甲 SDK 的报错都能看到，但是直接上真机很多报错会减少，这个由使用者自行决定，建议仅供参考

## 感谢

感谢各位 Flutter 开发者的支持和帮助，如果本插件能为你在开发过程中省下一点点的时间和精力算是达到了我开发插件的初衷。如果喜欢，欢迎点个 🌟 持续关注。如果项目关注度高，会继续开发 SDK 的剩余部分和分享一些开发插件的心得和踩坑经验。

## 个人联系方式

- QQ:505783958<br/>
- Wechat:wengxianxun<br/>
