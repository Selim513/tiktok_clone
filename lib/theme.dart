import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok_clone/core/fonts/app_fontstyle.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData(
    
    
    fontFamily: GoogleFonts.roboto().fontFamily,
    colorScheme: const ColorScheme.dark(),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: AppFontstyle.bold30,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
    ),

  );
}
