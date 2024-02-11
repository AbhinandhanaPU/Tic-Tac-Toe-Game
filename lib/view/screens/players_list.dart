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
              style: StyleConstant.nameStyle,
            ),
            SizedBox(height: 40),
            CustomTextField(
              controller: oneController,
              playerIcon: Icons.close,
              playerName: "Player One",
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: twoController,
              playerIcon: Icons.radio_button_off,
              playerName: "Player Two",
            ),
            SizedBox(height: 50),
            CustomButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
