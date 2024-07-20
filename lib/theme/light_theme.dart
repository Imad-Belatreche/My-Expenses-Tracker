import 'package:flutter/material.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 32, 10, 79),
);

final lightTheme = ThemeData.light().copyWith(
  colorScheme: kColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    scrolledUnderElevation: 8,
    elevation: 8,
    shadowColor: Colors.black87,
    backgroundColor: kColorScheme.onPrimaryContainer,
    foregroundColor: kColorScheme.onPrimary,
    titleTextStyle: const TextStyle(
      fontSize: 24,
    ),
  ),
  cardTheme: const CardTheme().copyWith(
    elevation: 5,
    shadowColor: Colors.black45,
    margin: const EdgeInsets.all(8),
    color: kColorScheme.primaryContainer,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: kColorScheme.onPrimary,
      backgroundColor: kColorScheme.primary,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: kColorScheme.primary,
    ),
  ),
  textTheme: ThemeData().textTheme.copyWith(
        bodyLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: kColorScheme.onPrimaryContainer,
        ),
        bodyMedium: TextStyle(
          color: kColorScheme.onPrimaryContainer,
        ),
      ),
  iconTheme: const IconThemeData().copyWith(
    color: kColorScheme.onPrimaryContainer,
  ),
);
