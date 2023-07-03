// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> zh = {
  "app_name": "Gallery",
  "language": {
    "en": "英语",
    "zh": "中文",
    "zh_CN": "中文",
    "zh_TW": "中文(繁体)"
  },
  "theme_mode": {
    "light": "浅色",
    "dark": "深色",
    "system": "自动（跟随系统设置）"
  },
  "page": {
    "home": {
      "title": "主页"
    }
  }
};
static const Map<String,dynamic> en = {
  "app_name": "Gallery",
  "language": {
    "en": "English",
    "zh": "Chinese",
    "zh_CN": "Chinese",
    "zh_TW": "Chinese (Traditional)"
  },
  "theme_mode": {
    "light": "Light",
    "dark": "Dark",
    "system": "Automatic (follow system settings)"
  },
  "page": {
    "home": {
      "title": "Home"
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"zh": zh, "en": en};
}
