import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'base_ui_spotlight_platform_interface.dart';

/// An implementation of [BaseUiSpotlightPlatform] that uses method channels.
class MethodChannelBaseUiSpotlight extends BaseUiSpotlightPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('base_ui_spotlight');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
