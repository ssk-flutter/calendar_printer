import 'package:flutter/material.dart';

import 'month_controller_widget.dart';
import 'year_controller_widget.dart';

class DateControllerWidget extends StatelessWidget {
  const DateControllerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildRow(context);
  }

  Widget buildRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        YearControllerWidget(),
        SizedBox(width: 16),
        MonthControllerWidget(),
        SizedBox(width: 16),
        // IconButton(
        //     onPressed: () {
        //       context.read<DateControllerViewModel>().reset();
        //     },
        //     icon: Icon(Icons.refresh)),
      ],
    );
  }
}
