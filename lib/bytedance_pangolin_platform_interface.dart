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

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
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
  }){
    throw UnimplementedError('register() 还没注册.');
  }
}
