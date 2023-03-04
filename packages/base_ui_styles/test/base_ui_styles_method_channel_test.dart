import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:base_ui_styles/base_ui_styles_method_channel.dart';

void main() {
  MethodChannelBaseUiStyles platform = MethodChannelBaseUiStyles();
  const MethodChannel channel = MethodChannel('base_ui_styles');

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
