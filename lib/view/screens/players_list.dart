import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe_game/utils/color_constant.dart';
import 'package:tictactoe_game/utils/style_constant.dart';
import 'package:tictactoe_game/view/screens/game_screen.dart';
import 'package:tictactoe_game/view/widgets/custom_button.dart';

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
    });
    super.initState();
  }

  @override
  void dispose() {
    oneController.dispose();
    twoController.dispose();
    super.dispose();
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
            TextField(
              controller: oneController,
              style: StyleConstant.rulesDes,
              decoration: InputDecoration(
                  border: StyleConstant.border,
                  focusedBorder: StyleConstant.focusedBorder,
                  prefixIcon: Icon(
                    Icons.close,
                    size: 30,
                    color: ColorConstant.primaryWhite,
                  ),
                  hintText: "Player X",
                  hintStyle: TextStyle(color: ColorConstant.primaryGrey)),
            ),
            SizedBox(height: 20),
            TextField(
              controller: twoController,
              style: StyleConstant.rulesDes,
              decoration: InputDecoration(
                  border: StyleConstant.border,
                  focusedBorder: StyleConstant.focusedBorder,
                  prefixIcon: Icon(
                    Icons.radio_button_off,
                    size: 30,
                    color: ColorConstant.primaryWhite,
                  ),
                  hintText: "Player O",
                  hintStyle: TextStyle(color: ColorConstant.primaryGrey)),
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
              },
            )
          ],
        ),
      ),
    );
  }
}
