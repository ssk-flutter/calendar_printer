import 'package:flutter/material.dart';

import '../widget/classic_calendar/classic_calendar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ClassicCalendar(),
          ],
        ),
      ),
    );
  }
}
