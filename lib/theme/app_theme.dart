import 'package:ceylontrailapp/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class AppTheme{
  static const colors = AppColors();

  const AppTheme._();

  static ThemeData define() {
    return ThemeData(
     fontFamily: GoogleFonts.openSans.toString(),

    );
  }
}