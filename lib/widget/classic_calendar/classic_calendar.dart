import 'package:flutter/material.dart';

import 'calendar_body_widget.dart';
import 'column_header_widget.dart';
import 'header_widget.dart';

class ClassicCalendar extends StatelessWidget {
  const ClassicCalendar({
    Key? key,
    required this.year,
    required this.month,
    required this.size,
  }) : super(key: key);

  final int year;
  final int month;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Column(
        children: [
          HeaderWidget(year: year, month: month),
          ColumnHeaderWidget(),
          Expanded(
              child: LayoutBuilder(
            builder: (context, constraints) => CalendarBodyWidget(
              year: year,
              month: month,
              size: Size(constraints.maxWidth, constraints.maxHeight),
            ),
          )),
        ],
      ),
    );
  }
}
