import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart'; // Remove this file

@injectable
class ThemeHelper {
  late ThemeData _defaultTheme;

  ThemeHelper() {
    _defaultTheme = _buildDefaultTheme();
  }

  get getDefaultTheme => _defaultTheme;

  _buildDefaultTheme() {
    return ThemeData(
      fontFamily: 'Montserrat',
      textTheme: TextTheme(
          headline1: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          headline2: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
          bodyMedium: const TextStyle(fontSize: 18)),
    );
  }
}
