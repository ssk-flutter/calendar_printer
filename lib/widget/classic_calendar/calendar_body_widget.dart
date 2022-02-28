import 'package:flutter/material.dart';

class CalendarBodyWidget extends StatelessWidget {
  CalendarBodyWidget({Key? key}) : super(key: key);

  final List days = List.generate(30, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: days.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 3 / 4,
      ),
      itemBuilder: (context, index) {
        return Text(days[index].toString());
      },
    );
  }
}
