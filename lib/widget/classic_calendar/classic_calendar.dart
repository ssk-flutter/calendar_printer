import 'package:flutter/material.dart';

import 'calendar_body_widget.dart';
import 'column_header_widget.dart';
import 'header_widget.dart';

class ClassicCalendar extends StatelessWidget {
  const ClassicCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(),
        ColumnHeaderWidget(),
        SizedBox(height: 500, child: CalendarBodyWidget()),
      ],
    );
  }
}
