import 'package:calendar_printer/view_model/calendar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/date_controller_view_model.dart';
import '../widget/classic_calendar/classic_calendar.dart';
import '../widget/controller/date_controller_widget.dart';
import '../widget/toolbar/toolbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CalendarViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => DateControllerViewModel(),
          ),
        ],
        builder: (context, _) {
          var isPortrait = MediaQuery.of(context).size.aspectRatio <= 1.0;
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: isPortrait
                    ? buildPortrait(context)
                    : buildLandscape(context),
              ),
            ),
          );
        });
  }

  Widget buildPortrait(BuildContext context) {
    return Column(
      children: [
        buildClassicCalendar(context),
        Spacer(),
        DateControllerWidget(),
        Spacer(),
        ToolbarWidget(),
      ],
    );
  }

  ClassicCalendar buildClassicCalendar(BuildContext context) {
    return ClassicCalendar(
      year: context.watch<DateControllerViewModel>().year,
      month: context.watch<DateControllerViewModel>().month,
      size: Size.square(MediaQuery.of(context).size.shortestSide),
    );
  }

  Widget buildLandscape(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        buildClassicCalendar(context),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Spacer(),
            DateControllerWidget(),
            Spacer(),
            ToolbarWidget(),
          ],
        ),
        Spacer(),
      ],
    );
  }
}
