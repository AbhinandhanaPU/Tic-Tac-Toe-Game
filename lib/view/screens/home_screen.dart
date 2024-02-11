import 'package:flutter/material.dart';
import 'package:tictactoe_game/utils/color_constant.dart';
import 'package:tictactoe_game/utils/style_constant.dart';
import 'package:tictactoe_game/view/screens/howto_play.dart';
import 'package:tictactoe_game/view/screens/players_list.dart';
import 'package:tictactoe_game/view/widgets/custom_button.dart';
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
            SizedBox(height: 20),
            Text(
              "TIC TAC TOE",
              style: StyleConstant.primaryTextStyle,
            ),
            SizedBox(height: 100),
            CustomButton(
              buttonText: "Start Game",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayersList(),
                    ));
              },
            ),
            SizedBox(height: 40),
            CustomButton(
              buttonText: "How to play",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameRules(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
