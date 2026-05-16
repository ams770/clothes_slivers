import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff121212);
  static const Color greyColor = Color.fromRGBO(50, 18, 18, 18);
  static const Color secondaryColor = Colors.white;
  static const Color backgroundColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: 'Poppins',
    // App Bar
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      centerTitle: true,
    ),
    // Text
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: primaryColor,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        color: primaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        color: primaryColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: TextStyle(
        color: primaryColor,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        color: primaryColor,
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: primaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: primaryColor,
        fontSize: 22,
        fontWeight: .bold,
      ),
      titleMedium: TextStyle(
        color: primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: primaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: primaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: primaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w300,
      ),
      labelLarge: TextStyle(
        color: primaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        color: primaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        color: primaryColor,
        fontSize: 11,
        fontWeight: FontWeight.w300,
      ),
    ),

    // Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        maximumSize: const Size(100, 50),
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),

    // Icon Button
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(primaryColor),
        backgroundColor: WidgetStatePropertyAll(secondaryColor),
        shape: WidgetStatePropertyAll(
          CircleBorder(side: BorderSide(color: primaryColor, width: 1)),
        ),
      ),
    ),

    // List Tile
    listTileTheme: ListTileThemeData(
      contentPadding: EdgeInsets.zero,
      titleTextStyle: TextStyle(
        color: greyColor,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      subtitleTextStyle: TextStyle(
        color: primaryColor,
        fontSize: 20,
        fontWeight: .w600,
      ),
    ),

    // Text Input
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryColor, width: 2),
      ),
    ),
  );
}
