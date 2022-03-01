import 'package:calendar_printer/view_model/date_controller_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'number_widget.dart';

class DateControllerWidget extends StatelessWidget {
  const DateControllerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => DateControllerViewModel(),
        builder: (context, _) {
          return buildRow(context);
        });
  }

  Widget buildRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        YearControlWidget(),
        SizedBox(width: 16),
        MonthControlWidget(),
      ],
    );
  }
}

const double kNumberWidgetWidth = 20;
const double kNumberWidgetHeight = 20;

class YearControlWidget extends StatelessWidget {
  const YearControlWidget({Key? key}) : super(key: key);

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

class MonthControlWidget extends StatelessWidget {
  const MonthControlWidget({Key? key}) : super(key: key);

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

class NumberSliderWidget extends StatelessWidget {
  const NumberSliderWidget({
    Key? key,
    required this.count,
    required this.startingNumber,
    required this.initialPage,
    required this.onPageChanged,
  }) : super(key: key);

  final int count;
  final int startingNumber;
  final int initialPage;
  final void Function(dynamic page) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kNumberWidgetWidth,
      height: kNumberWidgetHeight,
      alignment: Alignment.centerRight,
      child: CarouselSlider(
        items: List.generate(count, (index) {
          return NumberWidget(index + startingNumber);
        }),
        options: CarouselOptions(
          scrollDirection: Axis.vertical,
          height: kNumberWidgetHeight,
          aspectRatio: 1 / 1,
          viewportFraction: 0.8,
          initialPage: initialPage,
          autoPlay: false,
          enableInfiniteScroll: true,
          pageSnapping: true,
          onPageChanged: (page, reason) => onPageChanged(page),
        ),
      ),
    );
  }
}
