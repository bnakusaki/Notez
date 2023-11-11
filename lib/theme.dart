import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Colors.black,
  ),

  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w600,
    ),
  ),

  // Widget theme.
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    color: Colors.transparent,
    foregroundColor: Colors.black,
    centerTitle: false,
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      fixedSize: const Size(150, 50),
    ),
  ),

  bottomAppBarTheme: const BottomAppBarTheme(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    height: 70.0,
  ),

  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
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
);
