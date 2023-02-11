import 'package:flutter/cupertino.dart';
import '../colors/colors.dart';

class Tables extends StatelessWidget {
  final Function playMove;
  final List<String> board;
  final double table;
  final double iconSize;
  const Tables( {
    Key? key,
    required this.playMove,
    required this.board,
    required this.table,
    required this.iconSize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(table),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      children: List.generate(9, (index) {
        int row = index ~/ 3;
        int col = index % 3;
        return GestureDetector(
          onTap: () => playMove(index),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: row == 0
                    ? const BorderSide(
                        width: 0.0, color: AppColors.transperent)
                    : const BorderSide(width: 1.0, color: AppColors.brown),
                bottom: row == 2
                    ? const BorderSide(
                        width: 0.0, color: AppColors.transperent)
                    : const BorderSide(width: 1.0, color: AppColors.brown),
                left: col == 0
                    ? const BorderSide(
                        width: 0.0, color: AppColors.transperent)
                    : const BorderSide(width: 1.0, color: AppColors.brown),
                right: col == 2
                    ? const BorderSide(
                        width: 0.0, color: AppColors.transperent)
                    : const BorderSide(width: 1.0, color: AppColors.brown),
              ),
            ),
            child: board[index] != ''
                ? Center(
                    child: board[index] == 'O'
                        ?  Icon(
                            CupertinoIcons.circle,
                            color: AppColors.o_color,
                            size: iconSize,
                          )
                        :  Icon(
                            CupertinoIcons.xmark,
                            color: AppColors.x_color,
                            size: iconSize,
                          ))
                : const SizedBox(),
          ),
        );
      }),
    );
  }
}
