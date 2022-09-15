import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'globals.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      backgroundColor: Globals.darkPurple,
      primaryColor: Globals.lightPurple,
      textTheme: TextTheme(
          headline1: TextStyle(
            color: Globals.white,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
          headline2: TextStyle(
            color: Globals.white,
            fontFamily: GoogleFonts.nunitoSans().fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          headline3: TextStyle(
              color: Globals.white,
              fontFamily: GoogleFonts.nunitoSans().fontFamily,
              fontSize: 16.0),
          headline4: TextStyle(
              color: Globals.white,
              fontFamily: GoogleFonts.nunitoSans().fontFamily,
              fontSize: 16.0,
              decoration: TextDecoration.lineThrough,
              decorationThickness: 3),
          headline5: TextStyle(
              color: Globals.white,
              fontFamily: GoogleFonts.nunitoSans().fontFamily,
              fontSize: 12.0)),
      unselectedWidgetColor: Globals.white,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Color.fromARGB(1, 1, 1, 0);
          },
        ),
      ),
    );
  }
}
