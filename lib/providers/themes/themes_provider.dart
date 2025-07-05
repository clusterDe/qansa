import 'package:flutter/material.dart';
import 'package:qansa/data/helpers/shared_pref/shared_pref_helper.dart';
import 'package:qansa/themes/themes.dart';

class ThemesProvider extends ChangeNotifier {
  ThemesProvider() {
    _initTheme();
  }

  ThemeData? themeData;

  _initTheme() async {
    await _readSaveTheme();

    themeData = dataTheme(isDark: isDark);
    notifyListeners();
  }

  changeTheme() async {
    isDark = !isDark;
    notifyListeners();

    var result = await _saveTheme();
    if (result) {
      await _initTheme();
    }
  }

  final String _themeKey = 'theme-key';

  bool isDark = false;

  _readSaveTheme() async {
    var result = await SharedPrefHelper.readDataBool(keyName: _themeKey);

    if (result != null) {
      isDark = result;
      notifyListeners();
    }
  }

  Future<bool> _saveTheme() async {
    var result = await SharedPrefHelper.writeDataBool(
      keyName: _themeKey,
      dataBool: isDark,
    );

    if (result) {
      return true;
    } else {
      return false;
    }
  }
}
