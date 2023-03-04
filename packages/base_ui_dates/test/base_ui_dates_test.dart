import 'package:flutter_test/flutter_test.dart';
import 'package:base_ui_dates/base_ui_dates.dart';
import 'package:base_ui_dates/base_ui_dates_platform_interface.dart';
import 'package:base_ui_dates/base_ui_dates_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBaseUiDatesPlatform
    with MockPlatformInterfaceMixin
    implements BaseUiDatesPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BaseUiDatesPlatform initialPlatform = BaseUiDatesPlatform.instance;

  test('$MethodChannelBaseUiDates is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBaseUiDates>());
  });

  test('getPlatformVersion', () async {
    BaseUiDates baseUiDatesPlugin = BaseUiDates();
    MockBaseUiDatesPlatform fakePlatform = MockBaseUiDatesPlatform();
    BaseUiDatesPlatform.instance = fakePlatform;

    expect(await baseUiDatesPlugin.getPlatformVersion(), '42');
  });
}
