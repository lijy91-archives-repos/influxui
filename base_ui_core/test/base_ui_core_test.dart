import 'package:flutter_test/flutter_test.dart';
import 'package:base_ui_core/base_ui_core.dart';
import 'package:base_ui_core/base_ui_core_platform_interface.dart';
import 'package:base_ui_core/base_ui_core_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBaseUiCorePlatform
    with MockPlatformInterfaceMixin
    implements BaseUiCorePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BaseUiCorePlatform initialPlatform = BaseUiCorePlatform.instance;

  test('$MethodChannelBaseUiCore is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBaseUiCore>());
  });

  test('getPlatformVersion', () async {
    BaseUiCore baseUiCorePlugin = BaseUiCore();
    MockBaseUiCorePlatform fakePlatform = MockBaseUiCorePlatform();
    BaseUiCorePlatform.instance = fakePlatform;

    expect(await baseUiCorePlugin.getPlatformVersion(), '42');
  });
}
