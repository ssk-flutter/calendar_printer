import 'package:flutter/material.dart';

class ColumnHeaderWidget extends StatelessWidget {
  const ColumnHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     border: Border.all(
      //   color: Colors.black,
      // )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: ['일', '월', '화', '수', '목', '금', '토']
            .map((e) => Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: Text(
                      e,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: colorTable[e] ?? Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Map<String, ColorSwatch<int>> get colorTable {
    return {
      '일': Colors.red,
      '토': Colors.blueAccent,
    };
  }
}
