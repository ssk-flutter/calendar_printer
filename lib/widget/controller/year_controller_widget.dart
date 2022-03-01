import 'package:calendar_printer/view_model/date_controller_view_model.dart';
import 'package:calendar_printer/widget/controller/number_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YearControllerWidget extends StatelessWidget {
  const YearControllerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        YearNumberWidget(index: 0),
        YearNumberWidget(index: 1),
        YearNumberWidget(index: 2),
        YearNumberWidget(index: 3),
      ],
    );
  }
}

class YearNumberWidget extends StatelessWidget {
  const YearNumberWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return NumberSliderWidget(
      count: 10,
      startingNumber: 0,
      initialPage: context.read<DateControllerViewModel>().yearArray[index],
      onPageChanged: (page) => context
          .read<DateControllerViewModel>()
          .onChangeYearNumber(index, page),
    );
  }
}
