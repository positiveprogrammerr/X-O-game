import 'package:flutter/material.dart';
import '../colors/colors.dart';

class Header extends StatelessWidget {
  final double num1;
    Header(this.num1, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(
        top: 120,
        bottom: 50,
        left: num1,
        right: 50,
      ),
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      child: ListView.builder(
        itemCount: 100,
        scrollDirection: Axis.horizontal,
        itemExtent: 6,
        itemBuilder: (context, index) {
          return const SizedBox(
            child: CircleAvatar(
              backgroundColor: AppColors.brown,
              radius: 60,
            ),
          );
        },
      ),
    );
  }
}
