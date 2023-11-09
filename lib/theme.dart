import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Colors.black,
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 248, 248, 248),
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    color: Colors.transparent,
    foregroundColor: Colors.black,
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      fixedSize: const Size(350, 50),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(),
  ),
);
