import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required this.year,
    required this.month,
  }) : super(key: key);

  final int year;
  final int month;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.zero,
          child: Text(
            month.toString(),
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.end,
          ),
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              year.toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              monthToText(month),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        )
      ],
    );
  }

  String monthToText(int month) {
    return [
      '일월',
      '이월',
      '삼월',
      '사월',
      '오월',
      '유월',
      '칠월',
      '팔월',
      '구월',
      '시월',
      '십일월',
      '십이월',
    ][month - 1];
  }
}
