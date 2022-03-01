import 'package:calendar_printer/repository/calendar_repository.dart';
import 'package:flutter/material.dart';

class CalendarBodyWidget extends StatelessWidget {
  CalendarBodyWidget({Key? key}) : super(key: key);

  final List days = CalendarRepository()
      .getCalendarWeeks(
        year: DateTime.now().year,
        month: DateTime.now().month,
      )
      .expand((element) => element)
      .toList();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: days.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 3 / 4,
      ),
      itemBuilder: (context, index) {
        final DateTime date = days[index];
        return DateWidget(date: date);
      },
    );
  }
}

class DateWidget extends StatelessWidget {
  const DateWidget({
    Key? key,
    required this.date,
  }) : super(key: key);

  final DateTime date;

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
    if (date.month != DateTime.now().month) {
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
