import 'package:flutter/material.dart';
import 'package:tictactoe_game/utils/color_constant.dart';
import 'package:tictactoe_game/utils/style_constant.dart';
import 'package:tictactoe_game/view/widgets/logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReusableLogo(),
            SizedBox(height: 15),
            Text(
              "TIC TAC TOE",
              style: StyleConstant.primaryTextStyle,
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
