import 'package:flutter/material.dart';

import 'calendar_body_widget.dart';
import 'column_header_widget.dart';
import 'header_widget.dart';

class ClassicCalendar extends StatelessWidget {
  const ClassicCalendar({
    Key? key,
    required this.year,
    required this.month,
  }) : super(key: key);

  final int year;
  final int month;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(year: year, month: month),
        ColumnHeaderWidget(),
        SizedBox(
            height: 350,
            child: CalendarBodyWidget(
              year: year,
              month: month,
            )),
      ],
    );
  }
}
