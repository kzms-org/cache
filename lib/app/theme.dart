import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cache/play_ui/play_ui.dart';

abstract class WalletUiTheme {}

abstract class ThemeMixin {
  ThemeData getTheme(BuildContext context) {
    final primaryIconColor = HexColor('#000000');
    final iconColor = HexColor('#E64678');
    final accentIconColor = HexColor('#24485e');
    final secundaryColor = HexColor('#E64678');
    final backgroudColor = HexColor('#E5E5E5');
    final primaryColor = HexColor('#315FD6');
    final accentColor = HexColor('#E64678');

    return ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(
        TextTheme(
          bodyText1: TextStyle(
            color: primaryIconColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          bodyText2: TextStyle(
            color: secundaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          subtitle1: TextStyle(
            color: primaryIconColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          subtitle2: TextStyle(
            color: secundaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          button: TextStyle(
            color: primaryIconColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      iconTheme: IconThemeData(
        color: iconColor,
      ),
      primaryIconTheme: IconThemeData(
        color: primaryIconColor,
      ),
      accentIconTheme: IconThemeData(
        color: accentIconColor,
      ),
      backgroundColor: backgroudColor,
      primaryColor: primaryColor,
      accentColor: accentColor,
    );
  }
}
