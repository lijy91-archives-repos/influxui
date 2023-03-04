import 'package:flutter_test/flutter_test.dart';
import 'package:base_ui_spotlight/base_ui_spotlight.dart';
import 'package:base_ui_spotlight/base_ui_spotlight_platform_interface.dart';
import 'package:base_ui_spotlight/base_ui_spotlight_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBaseUiSpotlightPlatform
    with MockPlatformInterfaceMixin
    implements BaseUiSpotlightPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BaseUiSpotlightPlatform initialPlatform = BaseUiSpotlightPlatform.instance;

  test('$MethodChannelBaseUiSpotlight is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBaseUiSpotlight>());
  });

  test('getPlatformVersion', () async {
    BaseUiSpotlight baseUiSpotlightPlugin = BaseUiSpotlight();
    MockBaseUiSpotlightPlatform fakePlatform = MockBaseUiSpotlightPlatform();
    BaseUiSpotlightPlatform.instance = fakePlatform;

    expect(await baseUiSpotlightPlugin.getPlatformVersion(), '42');
  });
}
