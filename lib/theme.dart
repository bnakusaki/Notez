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
);
