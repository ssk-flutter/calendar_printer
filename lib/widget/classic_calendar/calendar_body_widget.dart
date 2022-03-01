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
        var date = days[index];
        return Text(
          date.day.toString(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: date.month != DateTime.now().month
                  ? Colors.grey
                  : Colors.black),
        );
      },
    );
  }
}
