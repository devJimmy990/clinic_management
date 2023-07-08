import 'package:flutter/material.dart';

import 'colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      primaryColor: lightprimary,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: ColorScheme(
        primary: lightprimary,
        onPrimary: Colors.white,
        secondary: greenColor,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.grey.shade300,
        onSurface: colorBlack,
        background: backgroundColor,
        onBackground: Colors.white,
        brightness: Brightness.light,
      ),
      appBarTheme:const AppBarTheme(
          backgroundColor: lightprimary,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme:const TextTheme(
          displayLarge: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 20, color: lightprimary),
          titleSmall: TextStyle(fontSize: 20, color: greenColor)),
      floatingActionButtonTheme:const
          FloatingActionButtonThemeData(backgroundColor: lightprimary),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: lightprimary,
          unselectedItemColor: Colors.grey.shade400));
  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme(
      primary: darkPrimary,
      onPrimary: Colors.white,
      secondary: yellowColor,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.grey.shade300,
      onSurface: colorBlack,
      background: Colors.transparent,
      onBackground: Colors.white,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: darkPrimary)),
    textTheme:const TextTheme(
        displayLarge: TextStyle(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontSize: 20, color: yellowColor)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: darkPrimary,
        selectedItemColor: yellowColor,
        unselectedItemColor: Colors.white),
  );
}
