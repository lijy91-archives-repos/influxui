import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:base_ui_dates/base_ui_dates_method_channel.dart';

void main() {
  MethodChannelBaseUiDates platform = MethodChannelBaseUiDates();
  const MethodChannel channel = MethodChannel('base_ui_dates');

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
