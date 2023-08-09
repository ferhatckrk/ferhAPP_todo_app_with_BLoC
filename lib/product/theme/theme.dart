import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_todo_app_with_bloc/product/constant/project_colors.dart';

class ProjectTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        textTheme: _customTextStylesLight(),
        scaffoldBackgroundColor: ProjectColors.white,
        elevatedButtonTheme: _elevatedButtonLight(),
        inputDecorationTheme: _inputDecoration(),
        appBarTheme: const AppBarTheme(backgroundColor: ProjectColors.purple));
  }

  static InputDecorationTheme _inputDecoration() {
    return InputDecorationTheme(
      filled: true,
      hintStyle: TextStyle(
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          color: ProjectColors.darkGrey),
      fillColor: ProjectColors.grey,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10)),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonLight() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        backgroundColor: ProjectColors.purple,
      ),
    );
  }

  static TextTheme _customTextStylesLight() {
    return TextTheme(
      displayLarge: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          color: ProjectColors.black),
      displayMedium: TextStyle(
          fontSize: 18,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          color: ProjectColors.black),
      displaySmall: TextStyle(
          fontSize: 16,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          color: ProjectColors.black),
      headlineLarge: TextStyle(
          fontSize: 13,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          color: ProjectColors.black),
      headlineMedium: TextStyle(
          fontSize: 12,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          color: ProjectColors.black),
      headlineSmall: TextStyle(
          fontSize: 11,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          color: ProjectColors.black),
      bodyLarge: TextStyle(
        fontSize: 10,
        color: ProjectColors.black,
        fontFamily: GoogleFonts.ubuntu().fontFamily,
      ),
      bodyMedium: TextStyle(
        fontSize: 9,
        color: ProjectColors.black,
        fontFamily: GoogleFonts.ubuntu().fontFamily,
      ),
      bodySmall: TextStyle(
        fontSize: 8,
        color: ProjectColors.black,
        fontFamily: GoogleFonts.ubuntu().fontFamily,
      ),
      labelLarge: TextStyle(
        color: ProjectColors.black,
        fontWeight: FontWeight.w900,
        fontFamily: GoogleFonts.ubuntu().fontFamily,
        fontSize: 15,
      ),
      labelMedium: TextStyle(
        color: ProjectColors.black,
        fontWeight: FontWeight.w900,
        fontFamily: GoogleFonts.ubuntu().fontFamily,
        fontSize: 13,
      ),
      labelSmall: TextStyle(
        color: ProjectColors.black,
        fontWeight: FontWeight.w900,
        fontFamily: GoogleFonts.ubuntu().fontFamily,
        fontSize: 11,
      ),
      titleMedium: TextStyle(
          fontSize: 16,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          color: ProjectColors.black),
    );
  }
}
