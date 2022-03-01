import 'package:calendar_printer/app/const.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'number_widget.dart';

class NumberSliderWidget extends StatelessWidget {
  NumberSliderWidget({
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
  final controller = CarouselController();

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
        carouselController: controller,
      ),
    );
  }
}
