import 'package:flutter/material.dart';
import 'package:tictactoe_game/utils/style_constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text(
            "Start Game",
            style: StyleConstant.buttonText,
          ),
        ));
  }
}
