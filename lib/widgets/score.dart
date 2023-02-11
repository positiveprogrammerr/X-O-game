// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../colors/colors.dart';

class Score extends StatelessWidget {
  final int x_score;
  final int o_score;
  final double score;
  const Score(this.x_score,this.o_score,this.score,{super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
            height: 90,
            child: Text(
              '$x_score : $o_score',
              style:  TextStyle(fontSize: score, color: AppColors.white,fontFamily: 'Gantari'),
            ),
          );
  }
}