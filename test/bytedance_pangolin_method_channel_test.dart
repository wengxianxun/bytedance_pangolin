import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bytedance_pangolin/bytedance_pangolin_method_channel.dart';

void main() {
  MethodChannelBytedancePangolin platform = MethodChannelBytedancePangolin();
  const MethodChannel channel = MethodChannel('bytedance_pangolin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
