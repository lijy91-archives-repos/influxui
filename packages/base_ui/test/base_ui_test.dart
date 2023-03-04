import 'package:flutter_test/flutter_test.dart';
import 'package:base_ui/base_ui.dart';
import 'package:base_ui/base_ui_platform_interface.dart';
import 'package:base_ui/base_ui_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBaseUiPlatform
    with MockPlatformInterfaceMixin
    implements BaseUiPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BaseUiPlatform initialPlatform = BaseUiPlatform.instance;

  test('$MethodChannelBaseUi is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBaseUi>());
  });

  test('getPlatformVersion', () async {
    BaseUi baseUiPlugin = BaseUi();
    MockBaseUiPlatform fakePlatform = MockBaseUiPlatform();
    BaseUiPlatform.instance = fakePlatform;

    expect(await baseUiPlugin.getPlatformVersion(), '42');
  });
}
