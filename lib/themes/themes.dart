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
        borderSide: const BorderSide(color: Colors.grey),
      ),
      outlineBorder: const BorderSide(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defBorderRadius),
        borderSide: const BorderSide(color: Colors.grey),
      ),
    ),
    tabBarTheme: TabBarThemeData(
      labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Color(0xFFC7C7C7),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defBorderRadius),
        ),
        foregroundColor: Colors.white,
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
      overlayColor: WidgetStatePropertyAll(Colors.white),
      splashRadius: 16,
    ),
  );

  return themeData;
}
