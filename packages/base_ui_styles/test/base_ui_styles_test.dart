import 'package:flutter_test/flutter_test.dart';
import 'package:base_ui_styles/base_ui_styles.dart';
import 'package:base_ui_styles/base_ui_styles_platform_interface.dart';
import 'package:base_ui_styles/base_ui_styles_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBaseUiStylesPlatform
    with MockPlatformInterfaceMixin
    implements BaseUiStylesPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BaseUiStylesPlatform initialPlatform = BaseUiStylesPlatform.instance;

  test('$MethodChannelBaseUiStyles is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBaseUiStyles>());
  });

  test('getPlatformVersion', () async {
    BaseUiStyles baseUiStylesPlugin = BaseUiStyles();
    MockBaseUiStylesPlatform fakePlatform = MockBaseUiStylesPlatform();
    BaseUiStylesPlatform.instance = fakePlatform;

    expect(await baseUiStylesPlugin.getPlatformVersion(), '42');
  });
}
