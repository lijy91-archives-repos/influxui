import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'base_ui_dates_method_channel.dart';

abstract class BaseUiDatesPlatform extends PlatformInterface {
  /// Constructs a BaseUiDatesPlatform.
  BaseUiDatesPlatform() : super(token: _token);

  static final Object _token = Object();

  static BaseUiDatesPlatform _instance = MethodChannelBaseUiDates();

  /// The default instance of [BaseUiDatesPlatform] to use.
  ///
  /// Defaults to [MethodChannelBaseUiDates].
  static BaseUiDatesPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BaseUiDatesPlatform] when
  /// they register themselves.
  static set instance(BaseUiDatesPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
