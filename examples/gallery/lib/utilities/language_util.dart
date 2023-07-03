import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

const kLanguageEN = 'en';
const kLanguageZH = 'zh';

final List<String> kAppLanguages = [
  kLanguageEN,
  kLanguageZH,
];

String getLanguageName(String language) {
  return 'language.$language'.tr();
}

Locale languageToLocale(String language) {
  if (language.contains('-')) {
    return Locale(
      language.substring(0, 1).toUpperCase(),
      language.substring(1),
    );
  }
  return Locale(language);
}
