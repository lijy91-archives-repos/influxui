import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'base_ui_spotlight_method_channel.dart';

abstract class BaseUiSpotlightPlatform extends PlatformInterface {
  /// Constructs a BaseUiSpotlightPlatform.
  BaseUiSpotlightPlatform() : super(token: _token);

  static final Object _token = Object();

  static BaseUiSpotlightPlatform _instance = MethodChannelBaseUiSpotlight();

  /// The default instance of [BaseUiSpotlightPlatform] to use.
  ///
  /// Defaults to [MethodChannelBaseUiSpotlight].
  static BaseUiSpotlightPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BaseUiSpotlightPlatform] when
  /// they register themselves.
  static set instance(BaseUiSpotlightPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
