import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final GetStorage _box = GetStorage();
  final _boxKey = 'isDarkMode';

  _saveThemeToBox(bool isDarkMode) {
    _box.write(_boxKey, isDarkMode);
  }

  bool _loadThemeFromBox() {
    return _box.read<bool>(_boxKey) ?? false;
  }

  ThemeMode get themeMode =>
      _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchThemeMode() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
