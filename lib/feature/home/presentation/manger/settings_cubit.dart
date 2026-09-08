import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopix_user/core/data/user_data.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  static const String _boxName = 'settingsBox';
  static const String _settingsKey = 'user_settings_key';

  SettingsCubit()
    : super(
        SettingsState(
          settings: UserSettings(),
          themeMode: ThemeMode.system,
          locale: const Locale('en'),
        ),
      ) {
    loadSettings();
  }

  UserSettings loadSettings() {
    final box = Hive.box<UserSettings>(_boxName);
    final settings = box.get(_settingsKey) ?? UserSettings();
    _emitState(settings);
    return settings;
  }

  Future<void> _updateSettings(UserSettings newSettings) async {
    _emitState(newSettings);
    final box = Hive.box<UserSettings>(_boxName);
    await box.put(_settingsKey, newSettings);
  }

  void _emitState(UserSettings settings) {
    emit(
      SettingsState(
        settings: settings,
        themeMode: settings.isDark ? ThemeMode.dark : ThemeMode.light,
        locale: Locale(settings.languageCode),
      ),
    );
  }

  Future<void> updateTheme(bool isdark) async {
    final updated = state.settings.copyWith(isDark: isdark);
    await _updateSettings(updated);
  }

  Future<void> updateLanguage(String langCode) async {
    final updated = state.settings.copyWith(languageCode: langCode);
    await _updateSettings(updated);
  }

  Future<void> pickProfileImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null && !isClosed) {
      await updateProfileImage(image.path);
    }
  }

  Future<void> updateProfileImage(String imagePath) async {
    if (state.settings.userProfileImagePath != null) {
      final oldFile = File(state.settings.userProfileImagePath!);
      if (oldFile.existsSync()) {
        await FileImage(oldFile).evict();
      }
    }

    final updated = state.settings.copyWith(userProfileImagePath: imagePath);
    await _updateSettings(updated);
  }

  Future<void> saveUserData({
    required String token,
    required String name,
    required String email,
    String? imagePath,
  }) async {
    final updated = state.settings.copyWith(
      userToken: token,
      userName: name,
      userEmail: email,
      userProfileImagePath: imagePath,
      hasCompletedOnboarding: true,
    );
    await _updateSettings(updated);
  }

  Future<void> logout() async {
    if (state.settings.userProfileImagePath != null) {
      final oldFile = File(state.settings.userProfileImagePath!);
      if (oldFile.existsSync()) {
        await FileImage(oldFile).evict();
      }
    }
    PaintingBinding.instance.imageCache.clear();
    PaintingBinding.instance.imageCache.clearLiveImages();
    final updated = state.settings.copyWith(
      clearUserEmail: true,
      clearUserName: true,
      clearUserProfileImagePath: true,
      clearUserToken: true,
      hasCompletedOnboarding: false,
    );
    await _updateSettings(updated);
  }
}
