import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  colorScheme: const ColorScheme.dark(primary: Colors.blue),
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
        fixedSize: const Size(150, 50),
        side: const BorderSide(color: Colors.white)),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(),
  ),
);
