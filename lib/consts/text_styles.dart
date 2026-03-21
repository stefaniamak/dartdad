import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle nameTextStyle = GoogleFonts.googleSans(
    fontSize: 22,
    color: Colors.white,
  );

  static TextStyle bodyTextStyle = GoogleFonts.googleSans(
    fontSize: 14,
    color: Colors.white,
  );

  static TextStyle codeTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 13.5,
    fontFamily: GoogleFonts.firaCode().fontFamily,
    height: 1.3,
  );
}
