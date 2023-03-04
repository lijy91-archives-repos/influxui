import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'base_ui_notifications_platform_interface.dart';

/// An implementation of [BaseUiNotificationsPlatform] that uses method channels.
class MethodChannelBaseUiNotifications extends BaseUiNotificationsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('base_ui_notifications');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
