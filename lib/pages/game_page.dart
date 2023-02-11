// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:tic_tac_original/widgets/button.dart';
import 'package:tic_tac_original/widgets/header.dart';
import 'package:tic_tac_original/widgets/score.dart';
import '../colors/colors.dart';
import '../widgets/game_table.dart';

class GamePage extends StatefulWidget {
  final String currentPlayer;
  const GamePage(
      {super.key,
      // ignore: non_constant_identifier_names
      required this.x_score,
      // ignore: non_constant_identifier_names
      required this.o_score,
      required this.currentPlayer});
  final int x_score;
  final int o_score;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> _board = [];
  String _currentPlayer = '';
  String winner = "";
  int x_score = 0;
  int o_score = 0;
  double num1 = 50;
  double num2 = 120;


  @override
  void initState() {
    x_score = widget.x_score;
    o_score = widget.o_score;
    _board = List.filled(9, '');
    _currentPlayer = widget.currentPlayer;
    super.initState();
  }

  void _switchPlayer() {
    _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
  }

  void _playMove(int index) {
    if (_board[index] == '' && winner == '') {
      setState(() {
        _board[index] = _currentPlayer;

        _switchPlayer();
        _checkWinner();
      });
    }
  }

  void _checkWinner() {
    var lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];

    for (var line in lines) {
      var a = _board[line[0]];
      var b = _board[line[1]];
      var c = _board[line[2]];

      if (a == b && b == c && a != '') {
        winner = a;
        if (winner == 'X') {
          x_score++;
        } else if (winner == 'O') {
          o_score++;
        }
        break;
      } else if (winner == '' && !_board.contains('')) {
        winner = 'no one';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: !isLandScape
          ? Column(
              children: [
                 Header(num1),
                Score(x_score, o_score,50),
                Tables(
                  playMove: _playMove,
                  board: _board,
                  table:53,
                  iconSize: 65,
                ),
                Button(
                  x_score,
                  o_score,
                  _board,
                  'NEW GAME',
                  12,
                  widget.currentPlayer,
                  295
                ),
                Button(x_score, o_score, _board, 'RESET GAME', 80,
                    widget.currentPlayer,295)
              ],
            )
          : SingleChildScrollView(
            child: Column(children: [
                Header(num2),
              Score(x_score, o_score,80),
              Tables(
                playMove: _playMove,
                board: _board,
                table: 150,
                iconSize: 90,
              ),
              Button(
                x_score,
                o_score,
                _board,
                'NEW GAME',
                12,
                widget.currentPlayer,
                700
              ),
              Button(x_score, o_score, _board, 'RESET GAME', 80,
                  widget.currentPlayer,700)
            ]),
          ),
    );
  }
}
