import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/colors.dart';
import 'game_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'Choose position',
          style: TextStyle(
              fontFamily: 'Gantari', fontSize: 43, color: AppColors.white),
        ),
        const SizedBox(
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(70),
              ),
              child: IconButton(
                  onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) => const GamePage(
                                currentPlayer: 'X', o_score: 0, x_score: 0)),
                      ),
                  icon: const Icon(CupertinoIcons.xmark,
                      color: AppColors.x_color, size: 90)),
            ),
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(70),
              ),
              child: IconButton(
                  onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) => const GamePage(
                                currentPlayer: 'O', o_score: 0, x_score: 0)),
                      ),
                  icon: const Icon(
                    CupertinoIcons.circle,
                    color: Colors.black,
                    size: 90,
                  )),
            )
          ],
        )
      ]),
    );
  }
}
