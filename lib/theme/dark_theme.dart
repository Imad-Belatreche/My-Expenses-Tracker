import 'package:flutter/material.dart';

final kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 115, 75, 158),
);

final darkTheme = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme().copyWith(
    scrolledUnderElevation: 8,
    elevation: 8,
    shadowColor: Colors.white24,
    foregroundColor: kDarkColorScheme.secondaryContainer,
    backgroundColor: kDarkColorScheme.onSecondaryContainer,
  ),
  cardTheme: const CardTheme().copyWith(
    elevation: 5,
    shadowColor: Colors.white10,
    margin: const EdgeInsets.all(8),
    color: kDarkColorScheme.onPrimaryFixedVariant,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: kDarkColorScheme.onSecondary,
      backgroundColor: kDarkColorScheme.secondary,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: kDarkColorScheme.secondaryContainer,
    ),
  ),
  textTheme: ThemeData().textTheme.copyWith(
        bodyLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: kDarkColorScheme.primaryFixed,
        ),
        bodyMedium: TextStyle(
          color: kDarkColorScheme.primaryFixed,
        ),
      ),
  iconTheme: const IconThemeData().copyWith(
    color: kDarkColorScheme.primaryFixed,
  ),
);
