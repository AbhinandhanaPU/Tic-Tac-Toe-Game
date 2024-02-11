import 'package:flutter/material.dart';
import 'package:tictactoe_game/utils/color_constant.dart';
import 'package:tictactoe_game/utils/style_constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.playerIcon,
    required this.playerName,
    required this.controller,
  });
  final IconData playerIcon;
  final String playerName;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: StyleConstant.border,
          focusedBorder: StyleConstant.focusedBorder,
          prefixIcon: Icon(
            playerIcon,
            size: 30,
            color: ColorConstant.primaryWhite,
          ),
          hintText: playerName,
          hintStyle: TextStyle(color: ColorConstant.primaryGrey)),
    );
  }
}
