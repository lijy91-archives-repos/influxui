import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'base_ui_core_platform_interface.dart';

/// An implementation of [BaseUiCorePlatform] that uses method channels.
class MethodChannelBaseUiCore extends BaseUiCorePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('base_ui_core');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
