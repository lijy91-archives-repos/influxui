import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'base_ui_method_channel.dart';

abstract class BaseUiPlatform extends PlatformInterface {
  /// Constructs a BaseUiPlatform.
  BaseUiPlatform() : super(token: _token);

  static final Object _token = Object();

  static BaseUiPlatform _instance = MethodChannelBaseUi();

  /// The default instance of [BaseUiPlatform] to use.
  ///
  /// Defaults to [MethodChannelBaseUi].
  static BaseUiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BaseUiPlatform] when
  /// they register themselves.
  static set instance(BaseUiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
