import 'package:face_smash/aparence/themeStyles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static bool _iconBool = true;
  ThemeData principalTheme =
      new ThemeData(primarySwatch: Colors.amber, brightness: Brightness.light);
  IconData _iconLight = Icons.wb_sunny;
  IconData _iconDark = Icons.nights_stay;

  AppTheme(Enum style) {
    if (style == themeStyles.LIGHT) {
      _iconBool = true;
      principalTheme = _lightTheme;
    } else {
      _iconBool = false;
      principalTheme = _darkTheme;
    }
  }

  ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.amber,
    brightness: Brightness.light,
  );

  ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.purple,
    brightness: Brightness.dark,
  );

  void switchTheme() {
    _iconBool = !_iconBool;
  }

  ThemeData getCurrentTheme() {
    return _iconBool ? _lightTheme : _darkTheme;
  }

  IconData getCurrentIcon() {
    return _iconBool ? _iconLight : _iconDark;
  }
}
