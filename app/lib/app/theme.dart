import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AgroLensTheme {
  AgroLensTheme._();

  // Colors
  static const Color primaryGreen =
      Color(0xFF2E7D32);

  static const Color lightGreen =
      Color(0xFF4CAF50);

  static const Color accentGreen =
      Color(0xFF81C784);

  static const Color background =
      Color(0xFFF8FAF8);

  static const Color cardColor =
      Colors.white;

  static const Color textPrimary =
      Color(0xFF1E293B);

  static const Color textSecondary =
      Color(0xFF64748B);

  static const Color success =
      Color(0xFF16A34A);

  static const Color warning =
      Color(0xFFF59E0B);

  static const Color error =
      Color(0xFFDC2626);

  static ThemeData lightTheme =
      ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor:
        background,

    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryGreen,
      brightness: Brightness.light,
    ),

    textTheme:
        GoogleFonts.poppinsTextTheme(),

    appBarTheme: AppBarTheme(
      backgroundColor: background,
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0,
      titleTextStyle:
          GoogleFonts.poppins(
        color: textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: const IconThemeData(
        color: textPrimary,
      ),
    ),

    cardTheme: CardThemeData(
      color: cardColor,
      elevation: 3,
      shadowColor:
          Colors.black.withValues(
        alpha: 0.08,
      ),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(20),
      ),
    ),

    elevatedButtonTheme:
        ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            primaryGreen,
        foregroundColor:
            Colors.white,
        minimumSize:
            const Size(
          double.infinity,
          56,
        ),
        shape:
            RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(
            16,
          ),
        ),
      ),
    ),

    inputDecorationTheme:
        InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(16),
        borderSide:
            BorderSide.none,
      ),
      enabledBorder:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(16),
        borderSide:
            BorderSide.none,
      ),
      focusedBorder:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(16),
        borderSide:
            const BorderSide(
          color: primaryGreen,
          width: 2,
        ),
      ),
    ),

    navigationBarTheme:
        NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor:
          accentGreen.withValues(
        alpha: 0.3,
      ),
      labelTextStyle:
          WidgetStateProperty.all(
        GoogleFonts.poppins(
          fontWeight:
              FontWeight.w500,
        ),
      ),
    ),
  );
}