import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  GameScreen({
    super.key,
    required this.player2,
    required this.player1,
  });

  final String player1;
  final String player2;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<List<String>> board;
  late String currentplayer;
  late String winner;
  late bool gameover;

  @override
  void initState() {
    super.initState();
    board = List.generate(3, (index) => List.generate(3, (_) => ""));
    currentplayer = 'X';
    winner = "";
    gameover = false;
  }

  void resetgame() {
    setState(() {
      board = List.generate(3, (index) => List.generate(3, (v) => ''));
      currentplayer = 'X';
      winner = '';
      gameover = false;
    });
  }

  void makemove(int row, int col) {
    if (board[row][col] != '' || gameover) {
      return;
    }
    setState(() {
      board[row][col] = currentplayer;
      if (board[row][0] == currentplayer &&
          board[row][1] == currentplayer &&
          board[row][2] == currentplayer) {
        winner = currentplayer;
        gameover = true;
      } else if (board[0][col] == currentplayer &&
          board[1][col] == currentplayer &&
          board[2][col] == currentplayer) {
        winner = currentplayer;
        gameover = true;
      } else if (board[0][0] == currentplayer &&
          board[1][1] == currentplayer &&
          board[2][2] == currentplayer) {
        winner = currentplayer;
        gameover = true;
      } else if (board[0][2] == currentplayer &&
          board[1][1] == currentplayer &&
          board[2][0] == currentplayer) {
        winner = currentplayer;
        gameover = true;
      }
      //switch player
      currentplayer = currentplayer == 'O' ? 'X' : 'O';
      //check for a tie
      if (!board.any((row) => row.any((cell) => cell == ''))) {
        gameover = true;
        winner = 'its a tie';
      }

      if (winner != '') {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.leftSlide,
            title: winner == 'X'
                ? '${widget.player1} won!!'
                : winner == 'O'
                    ? "${widget.player1} won!!"
                    : 'its a tie',
            btnOkText: 'play again',
            btnOkOnPress: () {
              resetgame();
            }).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'turn: ',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  currentplayer == 'X'
                      ? '${widget.player1} ($currentplayer)'
                      : '${widget.player2} ($currentplayer)',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ]),
              Container(
                margin: EdgeInsets.all(5),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 9,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    int row = index ~/ 3;
                    int col = index % 3;
                    return GestureDetector(
                      onTap: () {
                        makemove(row, col);
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            board[row][col],
                            style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.bold,
                              color: board[row][col] == 'X'
                                  ? Colors.red
                                  : Color(0xff2E4156),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: TextButton(
                  onPressed: resetgame,
                  child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(17)),
                      child: Center(
                        child: Text(
                          'Reset Game',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
