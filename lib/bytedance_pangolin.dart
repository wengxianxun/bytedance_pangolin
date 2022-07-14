
import 'bytedance_pangolin_platform_interface.dart';

class BytedancePangolin {
  Future<String?> getPlatformVersion() {
    return BytedancePangolinPlatform.instance.getPlatformVersion();
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
    return BytedancePangolinPlatform.instance.register(appId: appId,useTextureView: useTextureView,appName: appName,allowShowNotify: allowShowNotify,
    allowShowPageWhenScreenLock: allowShowPageWhenScreenLock,debug: debug,supportMultiProcess: supportMultiProcess,
    directDownloadNetworkType: directDownloadNetworkType);
  }
}
