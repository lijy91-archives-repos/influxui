import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'base_ui_core_method_channel.dart';

abstract class BaseUiCorePlatform extends PlatformInterface {
  /// Constructs a BaseUiCorePlatform.
  BaseUiCorePlatform() : super(token: _token);

  static final Object _token = Object();

  static BaseUiCorePlatform _instance = MethodChannelBaseUiCore();

  /// The default instance of [BaseUiCorePlatform] to use.
  ///
  /// Defaults to [MethodChannelBaseUiCore].
  static BaseUiCorePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BaseUiCorePlatform] when
  /// they register themselves.
  static set instance(BaseUiCorePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
