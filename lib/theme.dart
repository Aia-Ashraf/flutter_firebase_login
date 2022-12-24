import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  primaryColorDark: const Color(0xFFEA526F),
  primaryColorLight: const Color(0xFF070600),
  primaryColor: const Color(0xFF279AF1),
  colorScheme: const ColorScheme.light(secondary: Color(0xFF23B5D3)),
  scaffoldBackgroundColor: const Color(0xFFF7F7FF),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
