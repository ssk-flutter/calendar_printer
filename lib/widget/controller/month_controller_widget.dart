import 'package:calendar_printer/view_model/date_controller_view_model.dart';
import 'package:calendar_printer/widget/controller/number_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MonthControllerWidget extends StatelessWidget {
  const MonthControllerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NumberSliderWidget(
      count: 12,
      startingNumber: 1,
      initialPage: context.read<DateControllerViewModel>().month - 1,
      onPageChanged: (page) =>
          context.read<DateControllerViewModel>().onChangeMonth(page + 1),
    );
  }
}
