import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bytedance_pangolin_platform_interface.dart';

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
}
