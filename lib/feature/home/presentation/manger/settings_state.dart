import 'package:flutter/material.dart';
import 'package:shopix_user/core/data/user_data.dart';

class SettingsState {
  final UserSettings settings;
  final ThemeMode themeMode;
  final Locale locale;

  const SettingsState({
    required this.settings,
    required this.themeMode,
    required this.locale,
  });

  SettingsState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
    UserSettings? settings,
  }) {
    return SettingsState(
      settings: settings ?? this.settings,
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}
