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
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
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
  }) async{
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
}
