import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'base_ui_notifications_method_channel.dart';

abstract class BaseUiNotificationsPlatform extends PlatformInterface {
  /// Constructs a BaseUiNotificationsPlatform.
  BaseUiNotificationsPlatform() : super(token: _token);

  static final Object _token = Object();

  static BaseUiNotificationsPlatform _instance = MethodChannelBaseUiNotifications();

  /// The default instance of [BaseUiNotificationsPlatform] to use.
  ///
  /// Defaults to [MethodChannelBaseUiNotifications].
  static BaseUiNotificationsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BaseUiNotificationsPlatform] when
  /// they register themselves.
  static set instance(BaseUiNotificationsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
