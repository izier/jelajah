import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var primaryButton = ElevatedButton.styleFrom(
  primary: Color(0xFF2F80ED),
  padding: EdgeInsets.symmetric(vertical: 16),
  side: BorderSide(width: 2, color: Color(0xFF2F80ED)),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
);

var secondaryButton = ElevatedButton.styleFrom(
  primary: Colors.white,
  onPrimary: Color(0xFF2F80ED),
  padding: EdgeInsets.symmetric(vertical: 16),
  side: BorderSide(width: 2, color: Color(0xFF2F80ED)),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
);

var fontStyle = TextTheme(
  headline1: GoogleFonts.lexend(
      fontSize: 24,
      fontWeight: FontWeight.w800,
      letterSpacing: 0.15
  ),
  button: GoogleFonts.lexend(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15
  ),
  bodyText1: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5
  ),
  bodyText2: GoogleFonts.lexend(
      fontSize: 16,
      color: Color(0xFF2F80ED),
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5
  ),

  headline2: GoogleFonts.lexend(
      fontSize: 61,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5
  ),
  headline3: GoogleFonts.lexend(
      fontSize: 48,
      fontWeight: FontWeight.w400
  ),
  headline4: GoogleFonts.lexend(
      fontSize: 34,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25
  ),
  headline5: GoogleFonts.lexend(
      fontSize: 24,
      fontWeight: FontWeight.w400
  ),
  headline6: GoogleFonts.lexend(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15
  ),
  subtitle1: GoogleFonts.lexend(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15
  ),
  subtitle2: GoogleFonts.lexend(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1
  ),
  caption: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4
  ),
  overline: GoogleFonts.inter(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5
  ),
);