import 'package:flutter_test/flutter_test.dart';
import 'package:base_ui_notifications/base_ui_notifications.dart';
import 'package:base_ui_notifications/base_ui_notifications_platform_interface.dart';
import 'package:base_ui_notifications/base_ui_notifications_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBaseUiNotificationsPlatform
    with MockPlatformInterfaceMixin
    implements BaseUiNotificationsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BaseUiNotificationsPlatform initialPlatform = BaseUiNotificationsPlatform.instance;

  test('$MethodChannelBaseUiNotifications is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBaseUiNotifications>());
  });

  test('getPlatformVersion', () async {
    BaseUiNotifications baseUiNotificationsPlugin = BaseUiNotifications();
    MockBaseUiNotificationsPlatform fakePlatform = MockBaseUiNotificationsPlatform();
    BaseUiNotificationsPlatform.instance = fakePlatform;

    expect(await baseUiNotificationsPlugin.getPlatformVersion(), '42');
  });
}
