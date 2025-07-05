import 'package:flutter/material.dart';
import 'package:qansa/data/helpers/custom_snackbar/custom_snackbar.dart';
import 'package:qansa/data/helpers/shared_pref/shared_pref_helper.dart';
import 'package:qansa/routes/routes.dart';
import 'package:qansa/themes/themes.dart';

class ThemesProvider extends ChangeNotifier {
  ThemesProvider() {
    _initTheme();
  }

  ThemeData? themeData;

  _initTheme() async {
    await _readSaveTheme();

    themeData = dataTheme(isDark: _isDark);
    notifyListeners();
  }

  changeTheme() async {
    _isDark = true;
    notifyListeners();

    await _saveTheme();
    _initTheme();
  }

  final String _themeKey = 'theme-key';

  bool _isDark = false;

  _readSaveTheme() async {
    var result = await SharedPrefHelper.readDataBool(keyName: _themeKey);

    if (result != null) {
      _isDark = true;
      notifyListeners();
    } else {
      _isDark = false;
      notifyListeners();
    }
  }

  _saveTheme() async {
    var result = await SharedPrefHelper.writeDataBool(
      keyName: _themeKey,
      dataBool: _isDark,
    );

    if (result) {
      var context = navigatorKey.currentState!.context;
      if (!context.mounted) return true;
      CsnackBar.show(context, content: 'Saved theme');
      return true;
    } else {
      var context = navigatorKey.currentState!.context;
      if (!context.mounted) return false;
      CsnackBar.show(context, content: 'Failed save theme');
      return false;
    }
  }
}
