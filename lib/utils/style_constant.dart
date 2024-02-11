import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe_game/utils/color_constant.dart';

class StyleConstant {
  static TextStyle primaryTextStyle = GoogleFonts.coiny(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      letterSpacing: 3,
      color: ColorConstant.primaryWhite);
  static TextStyle logoStyle = GoogleFonts.coiny(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: ColorConstant.primaryColor);
}
