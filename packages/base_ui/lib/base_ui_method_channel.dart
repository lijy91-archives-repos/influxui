import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'base_ui_platform_interface.dart';

/// An implementation of [BaseUiPlatform] that uses method channels.
class MethodChannelBaseUi extends BaseUiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('base_ui');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
