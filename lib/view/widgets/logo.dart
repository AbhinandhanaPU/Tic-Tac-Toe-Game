import 'package:flutter/material.dart';
import 'package:tictactoe_game/utils/color_constant.dart';
import 'package:tictactoe_game/utils/style_constant.dart';

class ReusableLogo extends StatelessWidget {
  const ReusableLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstant.primaryWhite.withOpacity(0.9),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 10,
            child: Text(
              "X",
              style: StyleConstant.logoStyle,
            ),
          ),
          Positioned(
            right: 10,
            top: 18,
            bottom: 10,
            child: Text(
              "O",
              style: StyleConstant.logoStyle,
            ),
          ),
        ],
      ),
    );
  }
}
