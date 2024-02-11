import 'package:flutter/material.dart';
import 'package:tictactoe_game/utils/color_constant.dart';
import 'package:tictactoe_game/utils/style_constant.dart';

class GameRules extends StatefulWidget {
  const GameRules({super.key});

  @override
  State<GameRules> createState() => _GameRulesState();
}

class _GameRulesState extends State<GameRules> {
  List<String> gameRules = [
    "Play occures on a 3 by 3 grid empty squares.",
    "Two players take turns marking empty squares.",
    "The first player uses X and the second player uses O.",
    "Players aim to get three of their symbols in a row, column, or diagonal.",
    "If one player places three of the same marks in a row, that player wins",
    "If the spaces are all filled and there is no winner, the game ends in a draw",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                color: ColorConstant.primaryWhite,
              ),
            ),
            SizedBox(height: 60),
            Text(
              "How to play ",
              style: StyleConstant.headStyle,
            ),
            SizedBox(height: 15),
            Divider(
              height: 1,
              endIndent: 180,
            ),
            SizedBox(height: 25),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: gameRules.length,
              separatorBuilder: (context, index) => SizedBox(height: 40),
              itemBuilder: (context, index) {
                return Text(
                  "${index + 1}.  ${gameRules[index]}",
                  style: StyleConstant.rulesDes,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
