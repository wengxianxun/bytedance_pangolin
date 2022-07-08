
import 'bytedance_pangolin_platform_interface.dart';

class BytedancePangolin {
  Future<String?> getPlatformVersion() {
    return BytedancePangolinPlatform.instance.getPlatformVersion();
  }

  Future<String?> getTest(){
    return BytedancePangolinPlatform.instance.getTest();
  }
}
