import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Mythemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: cream,
        // buttonTheme: ButtonThemeData(buttonColor: Colors.red),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Mythemes.darkBluish),
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.black)),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkcream,
        // buttonTheme: ButtonThemeData(buttonColor: lightBluish),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.red),
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.black)),
      );

  // colors
  static Color cream = Color(0xfff5f5f5);
  static Color darkcream = Vx.gray900;
  static Color darkBluish = Color(0xff403b58);
  static Color lightBluish = Vx.indigo500;
}
