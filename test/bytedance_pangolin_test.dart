import 'package:bytedance_pangolin/bytedance_pangolin.dart';
import 'package:bytedance_pangolin/bytedance_pangolin_method_channel.dart';
import 'package:bytedance_pangolin/bytedance_pangolin_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBytedancePangolinPlatform
    with MockPlatformInterfaceMixin
    implements BytedancePangolinPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String> getTest() {
    // TODO: implement getTest
    throw UnimplementedError();
  }
}

void main() {
  final BytedancePangolinPlatform initialPlatform =
      BytedancePangolinPlatform.instance;

  test('$MethodChannelBytedancePangolin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBytedancePangolin>());
  });

  test('getPlatformVersion', () async {
    BytedancePangolin bytedancePangolinPlugin = BytedancePangolin();
    MockBytedancePangolinPlatform fakePlatform =
        MockBytedancePangolinPlatform();
    BytedancePangolinPlatform.instance = fakePlatform;

    expect(await bytedancePangolinPlugin.getPlatformVersion(), '42');
  });
}
