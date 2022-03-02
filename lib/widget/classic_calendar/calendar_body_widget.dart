import 'package:calendar_printer/repository/calendar_repository.dart';
import 'package:flutter/material.dart';

class CalendarBodyWidget extends StatelessWidget {
  CalendarBodyWidget({
    Key? key,
    required this.year,
    required this.month,
    required this.size,
  }) : super(key: key);

  final int year;
  final int month;
  final Size size;

  late final List days = CalendarRepository()
      .getCalendarWeeks(
        year: year,
        month: month,
      )
      .expand((element) => element)
      .toList();

  @override
  Widget build(BuildContext context) {
    print('size: $size');
    var crossAxisCount = 7;
    var maxRows = 6;
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      children: days
          .map((date) => DateWidget(date: date, isMain: date.month == month))
          .toList(growable: false),
      childAspectRatio: size.aspectRatio * maxRows / crossAxisCount,
    );
  }
}

class DateWidget extends StatelessWidget {
  const DateWidget({
    Key? key,
    required this.date,
    required this.isMain,
  }) : super(key: key);

  final DateTime date;
  final bool isMain;

  bool get isHolyDay => false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 0.5)),
      padding: EdgeInsets.all(2),
      child: Text(
        date.day.toString(),
        style: getTextStyle(context),
        textAlign: TextAlign.right,
      ),
    );
  }

  TextStyle? getTextStyle(BuildContext context) => Theme.of(context)
      .textTheme
      .bodyMedium
      ?.copyWith(color: color, fontSize: 30);

  Color get color {
    if (!isMain) {
      return Colors.grey;
    }

    if (isHolyDay) {
      return Colors.red;
    }

    final colorMap = {
      DateTime.sunday: Colors.red,
      DateTime.saturday: Colors.blueAccent
    };

    return colorMap[date.weekday] ?? Colors.black;
  }
}
