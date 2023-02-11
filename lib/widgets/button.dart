// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, non_constant_identifier_names, duplicate_ignore, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:tic_tac_original/pages/game_page.dart'; 
import '../colors/colors.dart';

class Button extends StatefulWidget {
  // ignore: non_constant_identifier_names
  int x_score;
  int o_score;
  final double score;
  final List<String> board;
  final String title;
  final double bottom;
  final String _currentPlayer;
  Button(this.x_score, this.o_score, this.board, this.title, this.bottom,this._currentPlayer,this.score);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottom, left: 8, right: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          fixedSize:  Size(widget.score, 50),
          backgroundColor: AppColors.button,
          foregroundColor: AppColors.white,
          elevation: 3,
        ),
        onPressed: () {
          setState(() {
            if (widget.bottom == 12) {
               Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) =>  GamePage(
                          currentPlayer: widget._currentPlayer,
                          o_score:0,
                          x_score: 0)),
                      (route) => false);
            } else {
               Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => GamePage(
                          currentPlayer:widget._currentPlayer,
                          o_score: widget.o_score,
                          x_score: widget.x_score)),
                      (route) => false);
            }
          });
        },
        child: Text(
          widget.title,
          style: const TextStyle(
              fontFamily: 'Gantari', fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
