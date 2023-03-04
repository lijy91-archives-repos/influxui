import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'base_ui_styles_platform_interface.dart';

/// An implementation of [BaseUiStylesPlatform] that uses method channels.
class MethodChannelBaseUiStyles extends BaseUiStylesPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('base_ui_styles');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
