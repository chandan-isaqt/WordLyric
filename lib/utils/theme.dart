import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFF6F6F8),
    colorScheme: ColorScheme.light(
      secondary: const Color(0xFFF6F6F8),
      primary: Color.fromARGB(255, 120, 122, 124),
    ),
    dividerColor: Color.fromARGB(174, 195, 195, 196),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFFF6F6F8),
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black87),
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color.fromARGB(176, 248, 250, 252),

      hintStyle: TextStyle(color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 90, 114, 160),
          width: 0.5,
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF101623),

    // useMaterial3: false,
    colorScheme: ColorScheme.dark(
      secondary: Color(0xFF1F2838),
      primary: const Color.fromARGB(179, 199, 199, 199),
    ),

    // =====
    dividerColor: Color.fromARGB(255, 59, 77, 105),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF101623),
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1F2838),
      hintStyle: TextStyle(color: Colors.white70),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white24, width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF145BEC), width: 1),
      ),
      suffixIconColor: Colors.white70,
      prefixIconColor: Colors.white70,
    ),
  );
}
