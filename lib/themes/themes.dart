import 'package:flutter/material.dart';

import '../data/constant.dart';

ThemeData dataTheme({required bool isDark}) {
  var themeData = ThemeData(
    useMaterial3: true,
    popupMenuTheme: PopupMenuThemeData(
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defBorderRadius / 2),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: isDark ? Brightness.dark : Brightness.light,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: defPadding),
      labelStyle: const TextStyle(fontSize: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defBorderRadius),
        borderSide: const BorderSide(),
      ),
      outlineBorder: const BorderSide(),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defBorderRadius),
        borderSide: const BorderSide(),
      ),
    ),
    tabBarTheme: TabBarThemeData(
      labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defBorderRadius),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defBorderRadius),
        ),
      ),
    ),
    switchTheme: const SwitchThemeData(
      trackOutlineWidth: WidgetStatePropertyAll(0),
      splashRadius: 16,
    ),
  );

  return themeData;
}
