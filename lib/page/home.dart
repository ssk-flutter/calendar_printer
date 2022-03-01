import 'package:calendar_printer/view_model/calendar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/classic_calendar/classic_calendar.dart';
import '../widget/date_controller_widget.dart';
import '../widget/toolbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CalendarViewModel(),
        builder: (context, _) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ClassicCalendar(),
                    Spacer(),
                    DateControllerWidget(),
                    Spacer(),
                    ToolbarWidget(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
