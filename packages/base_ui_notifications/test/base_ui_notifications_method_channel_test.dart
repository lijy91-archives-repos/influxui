import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:base_ui_notifications/base_ui_notifications_method_channel.dart';

void main() {
  MethodChannelBaseUiNotifications platform = MethodChannelBaseUiNotifications();
  const MethodChannel channel = MethodChannel('base_ui_notifications');

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
