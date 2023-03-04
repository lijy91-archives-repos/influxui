import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'base_ui_dates_platform_interface.dart';

/// An implementation of [BaseUiDatesPlatform] that uses method channels.
class MethodChannelBaseUiDates extends BaseUiDatesPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('base_ui_dates');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
