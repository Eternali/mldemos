import 'package:flutter/material.dart';

final Map<String, ThemeData> themes = {
  'dark': DarkTheme,
  'light': LightTheme,
};

final ThemeData DarkTheme = ThemeData.dark().copyWith(
  primaryColor: MLDemosColors.teal[400],
  accentColor: MLDemosColors.grey[400],
);

final ThemeData LightTheme = ThemeData.light().copyWith(
  primaryColor: MLDemosColors.teal[400],
  accentColor: MLDemosColors.grey[400],
);

class MLDemosColors {
  static const Map<int, Color> gold = {
    100: const Color(0xFFFFFFAA),
    200: const Color(0xFFFFEA3D),
    300: const Color(0xFFFFD54F),
    400: const Color(0xFFE4B429),
  };
  static const Map<int, Color> grey = {
    100: const Color(0xFFDFDFDF),
    200: const Color(0xFFA2A2A2),
    300: const Color(0xFF787878),
    400: const Color(0xFF000000),
  };
  static const Map<int, Color> purple = {
    100: const Color(0xFFD0B4E7),
    200: const Color(0xFFBE33DA),
    300: const Color(0xFF8100B4),
    400: const Color(0xFF57058B),
  };
  static const Map<int, Color> teal = {
    100: const Color(0xFF97DFEF),
    200: const Color(0xFF00BED0),
    300: const Color(0xFF0098A5),
    400: const Color(0xFF005963),
  };
}

