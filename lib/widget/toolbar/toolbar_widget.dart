import 'package:calendar_printer/view_model/calendar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToolbarWidget extends StatelessWidget {
  const ToolbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            context.read<CalendarViewModel>().share(context);
          },
        ),
        IconButton(
          icon: Icon(Icons.print),
          onPressed: () {
            context.read<CalendarViewModel>().printPreview(context);
          },
        ),
      ],
    );
  }
}
