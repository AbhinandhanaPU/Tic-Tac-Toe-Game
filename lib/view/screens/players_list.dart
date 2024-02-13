import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe_game/utils/color_constant.dart';
import 'package:tictactoe_game/utils/style_constant.dart';
import 'package:tictactoe_game/view/screens/game_screen.dart';
import 'package:tictactoe_game/view/widgets/custom_button.dart';
import 'package:tictactoe_game/view/widgets/custome_textField.dart';

class PlayersList extends StatefulWidget {
  const PlayersList({super.key});

  @override
  State<PlayersList> createState() => _PlayersListState();
}

class _PlayersListState extends State<PlayersList> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        dialogBackgroundColor: ColorConstant.primaryColor,
        animType: AnimType.rightSlide,
        btnOkText: "OK",
        titleTextStyle: StyleConstant.rulesDes,
        descTextStyle: StyleConstant.rulesDes,
        buttonsTextStyle: StyleConstant.buttonText,
        title: "Entering players name is optional",
        desc: "You can start the game by clicking 'Start Game' button",
        btnOkColor: ColorConstant.primaryWhite,
        btnOkOnPress: () => Navigator.pop(context),
      ).show();
      // showDialog(
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     backgroundColor: ColorConstant.primaryColor.withOpacity(0.9),
      //     shadowColor: ColorConstant.primaryWhite,
      //     elevation: 15,
      //     title: Text(
      //       "Entering players name is optional",
      //       style: StyleConstant.rulesDes,
      //     ),
      //     content: Text(
      //       "You can start the game by clicking 'Start Game' button",
      //       style: StyleConstant.textStyle3,
      //       textAlign: TextAlign.justify,
      //     ),
      //     actions: [
      //       TextButton(
      //           onPressed: () => Navigator.pop(context),
      //           child: Text(
      //             "OK",
      //             style: StyleConstant.playerText,
      //           ))
      //     ],
      //   ),
      // );
    });
    super.initState();
  }

  TextEditingController oneController = TextEditingController();
  TextEditingController twoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter Players Name",
              style: StyleConstant.headStyle,
            ),
            SizedBox(height: 40),
            CustomTextField(
              controller: oneController,
              playerIcon: Icons.close,
              playerName: "Player X",
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: twoController,
              playerIcon: Icons.radio_button_off,
              playerName: "Player O",
            ),
            SizedBox(height: 20),
            Text(
              "Remember player ' X ' starts first",
              style: StyleConstant.textStyle3,
            ),
            SizedBox(height: 50),
            CustomButton(
              buttonText: "Start game",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(
                        playerOne: oneController.text.isNotEmpty
                            ? oneController.text
                            : "Player X",
                        playerTwo: twoController.text.isNotEmpty
                            ? twoController.text
                            : "Player O",
                      ),
                    ));
                oneController.clear();
                twoController.clear();
              },
            )
          ],
        ),
      ),
    );
  }
}
