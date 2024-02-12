import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe_game/utils/color_constant.dart';
import 'package:tictactoe_game/utils/style_constant.dart';
import 'package:tictactoe_game/view/widgets/logo.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    super.key,
    required this.playerOne,
    required this.playerTwo,
  });
  final String playerOne;
  final String playerTwo;
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<List<String>> _board;
  late String _currentPlayer;
  late String _winner;
  late bool _gameOver;
  @override
  void initState() {
    _board = List.generate(3, (_) => List.generate(3, (_) => ""));
    _currentPlayer = "X";
    _winner = "";
    _gameOver = false;
    super.initState();
  }

// Reset Game
  void _resetGame() {
    setState(() {
      _board = List.generate(3, (_) => List.generate(3, (_) => ""));
      _currentPlayer = "X";
      _winner = "";
      _gameOver = false;
    });
  }

  void _makeMove(int row, int col) {
    if (_board[row][col] != "" || _gameOver) {
      return;
    }

    setState(() {
      _board[row][col] = _currentPlayer;

      // Check for a winner
      if (_board[row][0] == _currentPlayer &&
          _board[row][1] == _currentPlayer &&
          _board[row][2] == _currentPlayer) {
        _winner = _currentPlayer;
        _gameOver = true;
      } else if (_board[0][col] == _currentPlayer &&
          _board[1][col] == _currentPlayer &&
          _board[2][col] == _currentPlayer) {
        _winner = _currentPlayer;
        _gameOver = true;
      } else if (_board[0][0] == _currentPlayer &&
          _board[1][1] == _currentPlayer &&
          _board[2][2] == _currentPlayer) {
        _winner = _currentPlayer;
        _gameOver = true;
      } else if (_board[0][2] == _currentPlayer &&
          _board[1][1] == _currentPlayer &&
          _board[2][0] == _currentPlayer) {
        _winner = _currentPlayer;
        _gameOver = true;
      }
      // Switch Players
      _currentPlayer = _currentPlayer == "X" ? "O" : "X";

      // Check for a drow
      if (!_board.any((row) => row.any((cell) => cell == ""))) {
        _gameOver = true;
        _winner = "Its a Drow";
      }
      if (_winner != "") {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          dialogBackgroundColor: ColorConstant.primaryColor,
          animType: AnimType.rightSlide,
          btnOkText: "Play Again",
          titleTextStyle: StyleConstant.primaryTextStyle,
          title: _winner == "X"
              ? widget.playerOne + " Won"
              : _winner == "O"
                  ? widget.playerTwo + " Won"
                  : _winner,
          btnOkOnPress: () => _resetGame(),
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: ReusableLogo(visible: false),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Turn :  ",
                  style: StyleConstant.playerText,
                ),
                Text(
                  _currentPlayer == "X"
                      ? widget.playerOne + " ($_currentPlayer)"
                      : widget.playerTwo + " ($_currentPlayer)",
                  style: StyleConstant.playerText,
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              color: ColorConstant.primaryWhite,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(2),
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  int row = index ~/ 3;
                  int col = index % 3;
                  return GestureDetector(
                    onTap: () => _makeMove(row, col),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorConstant.primaryColor,
                        border: Border.all(
                          color: ColorConstant.primaryWhite,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          _board[row][col],
                          style: GoogleFonts.coiny(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: _board[row][col] == "X"
                                  ? Color(0xFFE25041)
                                  : Color(0xFF1CBD9E)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 25),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        widget.playerOne,
                        style: StyleConstant.playerText,
                      ),
                      Text(
                        "X",
                        style: StyleConstant.primaryTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 180,
                    child: VerticalDivider(
                      thickness: 2,
                      color: ColorConstant.primaryGrey,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        widget.playerTwo,
                        style: StyleConstant.playerText,
                      ),
                      Text(
                        "O",
                        style: StyleConstant.primaryTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
