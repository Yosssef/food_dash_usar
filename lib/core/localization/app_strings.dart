import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AppStrings {
  AppStrings._();

  static Map<String, dynamic> _en = const {};
  static Map<String, dynamic> _ar = const {};
  static bool _loaded = false;

  static Future<void> load() async {
    if (_loaded) return;
    final enRaw = await rootBundle.loadString('lib/core/localization/en.json');
    final arRaw = await rootBundle.loadString('lib/core/localization/ar.json');
    _en = json.decode(enRaw) as Map<String, dynamic>;
    _ar = json.decode(arRaw) as Map<String, dynamic>;
    _loaded = true;
  }

  static String t(
    String key,
    String languageCode, {
    Map<String, String>? params,
  }) {
    final map = languageCode == 'ar' ? _ar : _en;
    final parts = key.split('.');
    dynamic value = map;
    for (final part in parts) {
      if (value is Map<String, dynamic> && value.containsKey(part)) {
        value = value[part];
      } else {
        assert(false, 'Missing translation key: $key');
        return key;
      }
    }
    var result = value?.toString() ?? key;
    params?.forEach((placeholder, replacement) {
      result = result.replaceAll('{$placeholder}', replacement);
    });
    return result;
  }
}

extension TranslateX on BuildContext {
  String tr(String key) {
    return AppStrings.t(key, Localizations.localeOf(this).languageCode);
  }

  bool isarbic() {
    return Localizations.localeOf(this).languageCode == 'ar';
  }
}
