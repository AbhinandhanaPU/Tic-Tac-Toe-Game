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
  static TextStyle buttonText = GoogleFonts.poppins(
      fontSize: 20,
      letterSpacing: 2,
      fontWeight: FontWeight.bold,
      color: ColorConstant.primaryColor);
  static TextStyle nameStyle = GoogleFonts.poppins(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      letterSpacing: 3,
      color: ColorConstant.primaryWhite);

  // textformfield border style
  static OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 1.3));
  static OutlineInputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 2.0, color: ColorConstant.primaryWhite));
}
